import 'dart:io';
import 'package:doctor_app/core/utils/string.dart';
 import 'package:doctor_app/presentation/social_screen/controller/post_state.dart';
import 'package:doctor_app/presentation/user_profile/data/user.dart';
 import 'package:doctor_app/presentation/user_profile/presentation/controller/profile_cubit.dart';
import 'package:doctor_app/presentation/user_profile/presentation/controller/profile_state.dart';
import 'package:doctor_app/presentation/widget/circularProgress.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';


class Profile extends StatefulWidget {
  final String uid;

  Profile({super.key, required this.uid });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
   File? file;
  UserModed? user;
  @override
  void initState() {
    super.initState();
    setState(() {});

    fetchUser();

  }

   Future<void> fetchUser() async {
     var userData = await ProfileCubit().getUserData();
     setState(() {
       user = userData;
     });
   }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
        listener: (BuildContext context, state) {
      if (state is postLoading) {
    CircularProgress();
      } else if (state is postError) {
        Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),

              SizedBox(height: 20),
              Text("error"),
            ],
          ),
        );
      }
    }, builder: (context, state) {
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
                  ;
                //  String fileName = file!.split('/').last;
                  ProfileCubit().uploadProfileImageToSupabas(
                      fileName:"profile/${file!.path.split( "/").last} ",//"pppp",  //,"file!.path ,
                      file: file!,
                      Uid: FirebaseAuth.instance.currentUser!.uid);
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(user!.photoUrl??unknowmimage)
                 ),
              ),
            ),
            SizedBox(height: 20),
            Text(user!.username),
          ],
        ),
      );

    }
        // }
        );
  }
}
