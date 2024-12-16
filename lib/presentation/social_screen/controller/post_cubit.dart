import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/presentation/social_screen/controller/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../data/post_model.dart';
import '../data/comment_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class postCubit extends Cubit<postState> {
  late List<Post> postm;

  postCubit() : super(postInitial());

  Future<void> uploadPost(
    String ?description,
    String uid,
    String postId,
    String? photoUrl,
    String username,
    String profImage,
  ) async {
    try {
      emit(postLoading());
      FirebaseFirestore.instance.collection("post").doc(postId).set({
        "description": description??"",
        "uid": uid,
        "postId": postId,
        "datePublished": DateTime.now(),
        "photoUrl": photoUrl,//??"https://i.pinimg.com/736x/05/b4/fb/05b4fbc3f169175e6deb97b3977175b6.jpg"  ,
        "username": username,
        "profImage": profImage
      });
      emit(postSucess(posts: postm));
    } catch (e) {
      emit(postError(e.toString()));
      print(e.toString());
    }
  }

  Future<void> DelletePost(String postId) async {
    try {
      emit(postLoading());
      await FirebaseFirestore.instance.collection('post').doc(postId).delete();

      // emit(postSucess());
    } catch (err) {
      emit(postError(err.toString()));
      // res = err.toString();
    }
  }

  Future<void> commentPost(String postId, String text, String uid, String name,
      String profilePic) async {
    try {
      emit(postLoading());
      String commentId = Uuid().v4();
      Comment? comment;
      //Comment comment=Comment();
      FirebaseFirestore.instance
          .collection("post")
          .doc(postId)
          .collection("comment")
          .doc(commentId)
          .set(comment!.toJson());
      //emit(postSucess());
    } catch (e) {
      emit(postError(e.toString()));
      print(e.toString());
    }
  }

//   Future<String>profileImage(String childname,Uint8List file,)async{
//     final time=DateTime.now().microsecondsSinceEpoch;
//    var uid=FirebaseAuth.instance.currentUser!.uid;
//     // creating location to our firebase storage
//     Reference reference=
//     FirebaseStorage.instance.ref().child("childname/$uid") ;//.putData(file);
//
//     UploadTask uploadTask=reference.putData(file);
//     TaskSnapshot snapshot=await uploadTask;
//
//     String downloadUrl=await snapshot.ref.getDownloadURL();
//
// return downloadUrl;
//   }


  Future<String> uploadPostImageToSupabase(
      {required File file,
      required String fileName,
      required String postId}) async {
    final supabase = Supabase.instance.client;
    try {
      emit(postLoading());
      // Upload the file to the Supabase storage bucket
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
      //String postId=const Uuid().v1();
      FirebaseFirestore.instance.collection("post").doc(postId).update({
        "photoUrl": publicUrl
      }); // .collection("photourl").doc().set( {"photoUrl":publicUrl});
      // emit(postSucess( ));
      return publicUrl;
    } catch (e) {
      emit(postError(e.toString()));
      print("Error uploading to Supabase: $e");
      return "Error";
    }
  }

  //Future<Map<String, String>>
  Future<List<Post>> getData() async {
    //List< Post> ?posts;

    try {
      emit(postLoading());
      var querySnapshot =
          await FirebaseFirestore.instance.collection("post").get();

      var posts = await FirebaseFirestore.instance.collection("post").get();
      postm = await posts.docs.map((e) => Post.fromJson(e)).toList();
      print("mmpppppppppppppppppppmm");
      emit(postSucess(posts: postm));
      return postm!;
    } catch (h) {
      emit(postError(h.toString()));
      print("555555555555552${h}");
    }
    return postm;
  }

File? image;
ImagePicker? imagePicker;

  void pickImage() async {
    final pickfile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickfile != null) {
      image = File(pickfile.path);
    }
  }

}
//
// File? image;
// ImagePicker? imagePicker;
//
// void pickImage() async {
//   final pickfile = await ImagePicker().pickImage(source: ImageSource.gallery);
//
//   if (pickfile != null) {
//     image = File(pickfile.path);
//   }
// }

// Future<Uri> uploadPic() async {
//
//   //Get the file from the image picker and store it
//   XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
//
//   //Create a reference to the location you want to upload to in firebase
//   Reference reference = _storage.ref().child("images/");
//
//   //Upload the file to firebase
//    UploadTask uploadTask = reference.putFile(file);
//
//   // Waits till the file is uploaded then stores the download url
//   Uri location = await uploadTask.downloadUrl;
//
//   //returns the download url
//   return location;
// }

//}
