import 'package:doctor_app/presentation/social_screen/controller/post_cubit.dart';
import 'package:doctor_app/presentation/social_screen/controller/post_state.dart';
import 'package:doctor_app/presentation/social_screen/wedgit/delete_post.dart';
import 'package:doctor_app/presentation/social_screen/wedgit/react.dart';
import 'package:doctor_app/presentation/social_screen/wedgit/textfeiledwedgit.dart';
import 'package:doctor_app/presentation/user_profile/data/user.dart';
import 'package:doctor_app/presentation/user_profile/presentation/controller/profile_cubit.dart';
import 'package:doctor_app/presentation/user_profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/post_model.dart';

class SocialScreen extends StatefulWidget {
  SocialScreen({super.key});

  @override
  State<SocialScreen> createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
  String photoUrl = "";
  String username = "";
UserModed? user;
Post? post;
fettchUser()async{
    var userData=await ProfileCubit().getUserData();
  setState(() {
    user=  userData;

  });
  }
  fetchpost()async{
    var postData=await postCubit().getData();
setState(() {
  post=postData;
});

  }



  @override
  void initState() {
    super.initState();
    setState(() {});
    fettchUser();
    fetchpost();
    // fetchData();
  }
  //
  // Future<void> fetchData() async {
  //   final data = await postCubit().getData();
  //   setState(() {
  //     username = data["username"] ?? "Unknown";
  //     postUrl = data["postUrl"] ?? "";
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<postCubit, postState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  //height: 300,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Profile(
                                    uid: FirebaseAuth.instance.currentUser!.uid,
                                  )));
                        },
                        child: CircleAvatar(
                            radius: 16, backgroundImage: NetworkImage(user!.photoUrl.toString())),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TextFeiledWedgit()
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    CircleAvatar(
                        radius: 16, backgroundImage: NetworkImage(user!.photoUrl.toString())),
                    SizedBox(
                      width: 10,
                    ),
                    Text(username),
                    SizedBox(
                      width: 250,
                    ),
                    DeletePost()
                  ],
                ),
                // Container(
                //   height: 300,
                //   color: Colors.red,
                // ),

              Card(
                 // elevation: 50,
                  shadowColor: Colors.black,
                  color: Colors.white,//greenAccent[100],
                  child: SizedBox(
                    width: 400,
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green[500],
                            radius: 108,
                            child:   CircleAvatar(
                              backgroundImage: NetworkImage(
                                post!.photoUrl??""),
                                  //"https://media.geeksforgeeks.org/wp-content/uploads/20210101144014/gfglogo.png"), //NetworkImage
                              radius: 100,
                            ), //CircleAvatar
                          ), //CircleAvatar
                          const SizedBox(
                            height: 10,
                          ), //SizedBox

                          const Text(
                            'GeeksforGeeks is a computer science portal for geeks  !!',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.green,
                            ), //Textstyle
                          ), //Text
                      //SizedBox
                        ],
                      ), //Column
                    ), //Padding
                  ), //SizedBox
                ), //Card
                React()
              ],
            ),
          ),
        );
      },
    );
  }
}
