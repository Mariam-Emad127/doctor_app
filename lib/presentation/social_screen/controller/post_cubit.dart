import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/presentation/social_screen/controller/post_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../data/post_model.dart';
import '../data/comment_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class postCubit extends Cubit<postState> {
  postCubit() : super(postInitial());

  Future<void> uploadPost(String description,
      //Uint8List? file,
      //File ?file,
      String uid,
      String username,) async {
    try {
      emit(postLoading());
      String postId = Uuid().v4();
      Post? post;
      FirebaseFirestore.instance
          .collection("post")
          .doc(postId)
          .set(post!.toJson());
      emit(postSucess());
    } catch (e) {
      emit(postError(e.toString()));
      print(e.toString());
    }
  }

  // Future<void>getPost(){}
  // Future<void>likePost(){}
  Future<void> DelletePost(String postId) async {
    try {
      emit(postLoading());
      await FirebaseFirestore.instance.collection('post').doc(postId).delete();

      emit(postSucess());
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
      emit(postSucess());
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

  // final firebaseUser = FirebaseAuth.instance.currentUser;
  //
  // final response = await Supabase.instance.client.auth.api.createUser(
  // AdminUserAttributes(
  // email: firebaseUser.email,
  // userMetadata: {
  // 'firebaseUid': firebaseUser.uid,
  // },
  // ),
  //);
  Future<String> uploadProfileImageToSupabase({required File file, required String fileName,required String Uid})
  async {
   Post ?post;
   //String postId;
    final supabase = Supabase.instance.client;
    try {
      emit(postLoading());
      // Upload the file to the Supabase storage bucket
      final response = await supabase.storage.from("Doctor").upload("$fileName/", file);
      if (response != null) {
        print('Image uploaded successfully');
      }
      else {
        print('Errorrrrrrr');
      }

      final publicUrl = supabase.storage.from("Doctor").getPublicUrl("$fileName/");
      print("File uploaded successfully: $publicUrl");
      String docId=const Uuid().v1();
      FirebaseFirestore.instance.collection( "users").doc(Uid).update({"photoUrl":publicUrl});// .collection("photourl").doc().set( {"photoUrl":publicUrl});
      emit(postSucess( ));
      return publicUrl;
    }
    catch (e) {
      emit(postError(e.toString()));
      print("Error uploading to Supabase: $e");
      return "Error";
    }

  }




 Future<Map<String, String>> getData()async{
    String postUrl="";
    String username="";
    try{
      emit(postLoading());
      var user=await FirebaseFirestore.instance.collection( "users").doc(FirebaseAuth.instance.currentUser!.uid).get();
      username=await user.data()!["username"];
      postUrl =await user.data()!["photoUrl"];
      print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
      print(postUrl);
      print(username);

     }catch(h){
      emit(postError(h.toString()));
      print("2222222222222222222222222${h}");}
    return {"username": username, "postUrl": postUrl};
  }

}



 //
 //  async{
 // final picker = ImagePicker();
 // final imageFile = await picker.pickImage(
 // source: ImageSource.gallery,
 // maxWidth: 300,
 // maxHeight: 300,
 // );
 // if (imageFile == null) {
 // print( "null image");
 // }
 //    try {
 //      final bytes = await imageFile?.readAsBytes();
 //      final fileExt = imageFile!.path.split('.').last;
 //      final session = Supabase.instance.client.auth.currentSession;
 //      final user = session?.user;
 //      final fileName = '${DateTime.now().toIso8601String()}.$fileExt';
 //      //final filePath = '${ FirebaseAuth.instance.currentUser!.uid}/$fileName';
 //
 //      await Supabase.instance.
 //      //SupabaseInstance()
 //          //.supabase
 //          client
 //          .storage
 //          .from('Doctor')
 //          .uploadBinary(
 //         "profile",
 //        bytes!,
 //        fileOptions: FileOptions(contentType: imageFile.mimeType),
 //      );
 //
 //      final imageUrlResponse = await Supabase.instance.client.storage
 //          .from('Doctor')
 //          .createSignedUrl("profile", 60 * 60 * 24 * 365 * 10);
 //    } on StorageException catch (e) {
 //     // logger.d('😇upload error: $e');
 //      print(e);
 //    }
 //  }


 //  }
File? image;
  ImagePicker ?imagePicker;
  void pickImage()async{
    final pickfile=await ImagePicker(
    ).pickImage(source: ImageSource.gallery);

  if(pickfile!=null){
    image= File(pickfile.path);


  }


  }

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
