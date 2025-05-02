// ignore_for_file: camel_case_types
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/presentation/social_screen/controller/post_cubit/post_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/post_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class postCubit extends Cubit<postState> {
  late List<Post> postm;

  final supabase = Supabase.instance.client;
 
  postCubit() : super(postInitial());

  Future<void> uploadPost(
    File file,
    String fileName,
    String? description,
    String uid,
    String postId,
    String username,
    String profImage,
  ) async {
    try {
      emit(postLoading());
String name=file.path.split("/").last;
      await supabase.storage
          .from("Doctor")
          .upload("$fileName/${DateTime.now().minute}+$name", file);
        DateTime.now().minute;
      String publicUrl = supabase.storage
          .from("Doctor")
          .getPublicUrl("$fileName/${DateTime.now().minute}+$name");

      FirebaseFirestore.instance.collection("post").doc(postId).set({
        "description": description ?? "",
        "uid": uid,
        "postId": postId,
        "datePublished": DateTime.now(),
        "photoUrl": publicUrl,
        "username": username,
        "profImage": profImage,
        "like": [],
        "totalLikes": 0,
        "comment": []
      });
      emit(postSucess(posts: postm));
    } catch (e) {
      print("jjjjjjjjjjjjjjjjjjjjjjjjjjj$e");
      emit(postError(e.toString()));
    }
  }


  ///Delete post
  Future<void> DelletePost(String postId) async {
    try {
      emit(postLoading());
      await FirebaseFirestore.instance.collection('post').doc(postId).delete();

      emit(postLoading());
    } catch (err) {
      emit(postError(err.toString()));
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

  //File? image;

  final currentusr = FirebaseAuth.instance.currentUser!.uid;

  Future<void> likePost(String postId) async {
    //emit(postLoading());
    try {
      final postcollection =
          await FirebaseFirestore.instance.collection("post").doc(postId).get();

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

/*
  Future<void> uploadPostImageToSupabase({
    required File file,
    required String fileName,
    required String postId
    }) async {
    try {
      emit(postLoading());
      //final response =
      await supabase.storage.from("Doctor").upload("$fileName/${DateTime.now()}", file);
       // publicUrl = supabase.storage.from("Doctor").getPublicUrl("WhatsApp Image 2025-04-27 at 21.58.11_edc2f300.jpg");   
       print("File uploaded successfully: $publicUrl");
      FirebaseFirestore.instance.collection("post").doc(postId).update({
        "photoUrl": publicUrl
      });
 
    } catch (e) {
     // emit(postError(e.toString()));
      print("Error uploading to Supabase: $e");
     }
  }

*/