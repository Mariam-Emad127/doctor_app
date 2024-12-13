import 'package:doctor_app/presentation/social_screen/wedgit/textfeiledwedgit.dart';
import 'package:doctor_app/presentation/user_profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddPost extends StatelessWidget {
 final String photoUrl;
  const AddPost({super.key, required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Profile(
                  uid: FirebaseAuth.instance.currentUser!.uid,
                )));
          },
          child: CircleAvatar(
              radius: 16,
              backgroundImage:
              NetworkImage(photoUrl),
        ),),
        SizedBox(
          width: 10,
        ),


              TextFeiledWedgit(),

 
      ],
    );
  }
}
