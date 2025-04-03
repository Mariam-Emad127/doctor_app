import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/presentation/user_profile/data/user.dart';
import 'package:doctor_app/presentation/user_profile/presentation/controller/profile_state.dart';
 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';




class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit():super(ProfileInitial());

  Future<String> uploadProfileImageToSupabase({required File file, required String fileName,required String Uid})
  async {

    final supabase = Supabase.instance.client;
    try {
      emit(ProfieLoading());
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
      FirebaseFirestore.instance.collection( "users").doc(Uid).update({"photoUrl":publicUrl});
      //emit(ProfileSucess( ));
      return publicUrl;
    }
    catch (e) {
      emit(ProfileError(e.toString()));
      print("Error uploading to Supabase: $e");
      return "Error";
    }

  }

  Future<UserModed?> getUserData( )async{
//String email
   UserModed? userData;
    try{
      emit(ProfieLoading());
      var user=await FirebaseFirestore.instance.collection( "users").get();
      // .where("email",isEqualTo: email).get();
       userData=await user.docs.map((e) => UserModed.fromjson(e)) .single ;

String username=userData.username;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("username",username);
      print(userData.username);
   //   print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
      emit(ProfileSucess(user: userData));
    }catch(h){
      emit(ProfileError(h.toString()));
      print("222222222${h}");}
    return userData  ;

  }


//   Future<model.UserModed> getUserData( )async{
// //String email
//     UserModed ?userData;
//
//       var userm=await FirebaseFirestore.instance.collection( "users").get();
//       // .where("email",isEqualTo: email).get();
//       //  userData=await user.docs.map((e) => UserModed.fromjson(e)) .single ;
//
//       return model.UserModed.fromjson(userm);
//
//
//
//
//
//   }
  Future<String> uploadProfileImageToSupabas({required File file, required String fileName,required String Uid})
  async {
   
     final supabase = Supabase.instance.client;
    try {
      emit(ProfieLoading());
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
      //String docId=const Uuid().v1();
      FirebaseFirestore.instance.collection( "users").doc(Uid).update({"photoUrl":publicUrl});// .collection("photourl").doc().set( {"photoUrl":publicUrl});
      //emit(ProfileSucess( ));
      return publicUrl;
    }
    catch (e) {
      emit(ProfileError(e.toString()));
      print("Error uploading to Supabase: $e");
      return "Error";
    }

  }


Future<File?> picimage() async {
    var pickfile = await ImagePicker().pickImage(source: ImageSource.gallery);

if(pickfile!=null){
      File file = File(pickfile.path);
     return file;
  
  }
return null;}



}