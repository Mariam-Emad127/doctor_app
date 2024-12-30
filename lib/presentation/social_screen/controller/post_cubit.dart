import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/presentation/social_screen/controller/post_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
 import '../data/post_model.dart';
 import 'package:supabase_flutter/supabase_flutter.dart';

class postCubit extends Cubit<postState> {
  late List<Post> postm;
  //late Post post;
  postCubit() : super(postInitial());

  Future<void> uploadPost(String? description,
      String uid,
      String postId,
      String? photoUrl,
      String username,
      String profImage,) async {
    try {
      emit(postLoading());
      FirebaseFirestore.instance.collection("post").doc(postId).set({
        "description": description ?? "",
        "uid": uid,
        "postId": postId,
        "datePublished": DateTime.now(),
        "photoUrl": photoUrl,
        "username": username,
        "profImage": profImage,
        "like":[],
        "totalLikes":0,
        "comment":[]
      });
      emit(postSucess(posts: postm));
    } catch (e) {
      emit(postError(e.toString()));
      //print(e.toString());
    }
  }

  Future<void> DelletePost(String postId) async {
    try {
      emit(postLoading());
      await FirebaseFirestore.instance.collection('post').doc(postId).delete();

      emit(postLoading());
    } catch (err) {
      emit(postError(err.toString()));
    }
  }


  Future<String> uploadPostImageToSupabase({required File file,
    required String fileName,
    required String postId}) async {
    final supabase = Supabase.instance.client;
    try {
      emit(postLoading());
      final response =
      await supabase.storage.from("Doctor").upload("$fileName/", file);
      // if (response != null) {
      //   print('Image uploaded successfully');
      // } else {
      //   print('Errorrrrrrr');
      // }

      final publicUrl =
      supabase.storage.from("Doctor").getPublicUrl("$fileName/");
      print("File uploaded successfully: $publicUrl");
      FirebaseFirestore.instance.collection("post").doc(postId).update({
        "photoUrl": publicUrl
      });
      // emit(postSucess( ));
      return publicUrl;
    } catch (e) {
      emit(postError(e.toString()));
      print("Error uploading to Supabase: $e");
      return "Error";
    }
  }


  Stream<List<Post>> getDatastream() {
    final postCollection = FirebaseFirestore.instance
        .collection("post")
        .orderBy("datePublished", descending: true);
    return postCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => Post.fromJson(e)).toList());
  }

  Future<void> getData() async {
    emit(postLoading());
    try {
      final streamResponse = await getDatastream();
      streamResponse.listen((postm) {
        emit(postSucess(posts: postm));
      });
    } catch (e) {
      print(e);
    }
  }

  File? image;
  ImagePicker? imagePicker;

  void pickImage() async {
    final pickfile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickfile != null) {
      image = File(pickfile.path);
    }
  }

  final currentusr = FirebaseAuth.instance.currentUser!.uid;

  Future<void> likePost(String postId) async {
    //emit(postLoading());
    try {
      final postcollection = await FirebaseFirestore.instance.collection("post")
          .doc(postId)
          .get();

      if (postcollection.exists) {
        final totallike = postcollection.get("totalLikes");
        List likes = postcollection.get("like");
        if (likes.contains(currentusr)) {
          FirebaseFirestore.instance.collection("post").doc(postId).update({
            "like": FieldValue.arrayRemove([currentusr]),
            "totalLikes": totallike - 1,
          });
        } else {
          FirebaseFirestore.instance.collection("post").doc(postId).update({
            "like": FieldValue.arrayUnion([currentusr]),
            "totalLikes": totallike + 1,

          });
        }
      }
     // emit(postSucess(posts: postm));
    } catch (e) {
      print(e);
    }
  }
}

