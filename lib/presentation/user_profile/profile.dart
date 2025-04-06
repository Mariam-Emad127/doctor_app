import 'dart:io';
import 'package:doctor_app/core/utils/string.dart';
import 'package:doctor_app/presentation/user_profile/presentation/controller/profile_cubit.dart';
import 'package:doctor_app/presentation/user_profile/presentation/controller/profile_state.dart';
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
 
  @override
  Widget build(BuildContext context) {
  
  return BlocBuilder<ProfileCubit,ProfileState>(
    builder:(context,state){
if(state is ProfieLoading ){
     return     CircularProgress();
}else if(state is ProfileSucess){
   return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () async {
                  var pickfile = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  File? file;
                  if (pickfile != null) {
                    file = File(pickfile.path);
                  }
                  //  String fileName = file!.split('/').last;
                  ProfileCubit().uploadProfileImageToSupabas(
                      fileName:
                          "profile/${file!.path.split("/").last} ", //"pppp",  //,"file!.path ,
                      file: file,
                      uid: FirebaseAuth.instance.currentUser!.uid);
                },
                child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                       state.user?.photoUrl ?? AppStrings.unknowmimage)),
              ),
            ),
            const SizedBox(height: 20),
            // Text(user?.username??"unknowm"),
            Text(state.user!.username),
          ],
        ),
      );
}
else{
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
 
  }  );
  }
}
