import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/presentation/user_profile/data/user.dart';
import 'package:doctor_app/presentation/user_profile/controller/profile_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';




class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit():super(ProfileInitial());
    UserModed? userData;
String photoUrl="";
  Future<String> uploadProfileImageToSupabase({required File file, required String fileName,required String uid})
  async {

    final supabase = Supabase.instance.client;
    try {
      emit(ProfieLoading());
 String min=DateTime.now().minute.toString();
       await supabase.storage.from("Doctor").upload("$fileName/profile/$min", file);
 
      final publicUrl = supabase.storage.from("Doctor").getPublicUrl("$fileName/profile/$min");
 
      FirebaseFirestore.instance.collection( "users").doc(uid).update({"photoUrl":publicUrl});
            var user=await FirebaseFirestore.instance.collection( "users")//.get();
      .where("uid",isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
       userData=  user.docs.map((e) => UserModed.fromjson(e)).single ;
       getUserData();
      emit(ProfileSucess( photoUrl,user: userData  ));
      return publicUrl;
    }
    catch (e) {
      emit(ProfileError(e.toString()));
      //print("Error uploading to Supabase: $e");
      return "Error";
    }

  }

  Future<UserModed?> getUserData( )async{
    UserModed? userData;
    try{
      emit(ProfieLoading());
      var user=await FirebaseFirestore.instance.collection( "users")//.get();
      .where("uid",isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
       userData=  user.docs.map((e) => UserModed.fromjson(e)).single ;

 String photoUrl=userData.photoUrl??"";
    final SharedPreferences prefs = await SharedPreferences.getInstance();
 
    prefs.setString("photoUrl",photoUrl);
      emit(ProfileSucess(photoUrl,user: userData));
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


 
Future<File?> picimage() async {
    var pickfile = await ImagePicker().pickImage(source: ImageSource.gallery);

if(pickfile!=null){
      File file = File(pickfile.path);
     return file;
  
  }
return null;}



}