import 'dart:io';
import 'package:doctor_app/presentation/user_profile/controller/profile_cubit.dart';
import 'package:doctor_app/presentation/user_profile/controller/profile_state.dart';
import 'package:doctor_app/presentation/widget/circular_progress.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

 
class Profile extends StatefulWidget {
  final String uid;

  const Profile({super.key, required this.uid});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? file;
  String photoUrl="";
   @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
   
      listener: (BuildContext context,  state) { 
if(state is ProfieLoading){}
if(state is ProfileError ){}
 
if(state is ProfileSucess ){
 setState(() {
  
});

}


       },

       
      builder: (context, state) {
      if (state is ProfieLoading) {
        return CircularProgress();
      } else if (state is ProfileSucess) {
          photoUrl=state.user!.photoUrl??"";
        return Scaffold(
          backgroundColor: Colors.cyan,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.cyan,
          ),
          body: Column(children: [
            Expanded(
              child: Stack(
                  clipBehavior:
                      Clip.none, // Allows the image to overflow the stack

                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(30))),
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    Positioned(
                      top: 80,
                      left: 130,
                      child: Column(
                        children: [
                          CircleAvatar(
                              radius: 60,
                              backgroundImage: NetworkImage(
                              photoUrl 
                                      )),
                          Text(
                            state.user!.username,
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 160,
                      left: 237,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.blueGrey),
                          child: IconButton(
                            icon: Icon(Icons.edit),
                            color: Colors.blue,
                              onPressed: () async {
 

                  var pickfile = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  File? file;
                  if (pickfile != null) {
                    file = File(pickfile.path);
                   await ProfileCubit().uploadProfileImageToSupabase(
                      fileName:
                          "profile/${file.path.split("/").last} ",
                           
                      file: file,
                      uid: FirebaseAuth.instance.currentUser!.uid);
                  }
                   
                 setState(() {
                   photoUrl= state.path;
                 });  
                 setState(() {
                   context.read<ProfileCubit>().getUserData();
                 });    
                },
                         /*
                            onPressed: () async {
                           await   pickImage();
                              await context
                                  .read<ProfileCubit>()
                                  .uploadProfileImageToSupabase(
                                      file: file!,
                                      fileName:
                                          "profile/${file!.path.split("/").last} ",
                                      uid: FirebaseAuth
                                          .instance.currentUser!.uid);
                              setState(() {});
                            },
                         */
                          )),
                    ),
                   
                  ]),
            ),
          ]),
        );
 
      }
      
      
      
      else {
        return const Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              SizedBox(height: 20),
              Text("error"),
            ],
          ),
        );
      }
    }, );
  }

   
  
}
