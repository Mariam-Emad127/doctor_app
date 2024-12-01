import 'package:doctor_app/presentation/social_screen/controller/post_cubit.dart';
import 'package:doctor_app/presentation/social_screen/controller/post_state.dart';
import 'package:doctor_app/presentation/social_screen/wedgit/react.dart';
import 'package:doctor_app/presentation/social_screen/wedgit/textfeiledwedgit.dart';
import 'package:doctor_app/presentation/user_profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialScreen extends StatefulWidget {
  SocialScreen({super.key});

  @override
  State<SocialScreen> createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
  String postUrl = "";
  String username = "";

  @override
  void initState() {
    super.initState();
    setState(() {});
    fetchData();
  }

  Future<void> fetchData() async {
    final data = await postCubit().getData();
    setState(() {
      username = data["username"] ?? "Unknown";
      postUrl = data["postUrl"] ?? "";
    });
  }

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
                                   // email:"mg@gmail.com" //FirebaseAuth.instance.currentUser!.email??""

                              )));
                        },
                        child: CircleAvatar(
                            radius: 16, backgroundImage: NetworkImage(postUrl)),
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
                        radius: 16, backgroundImage: NetworkImage(postUrl)),
                    SizedBox(
                      width: 10,
                    ),
                    Text(username),
                    SizedBox(
                      width: 250,
                    ),
                    Expanded(
                      child: IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 16),
                                          child: Text('Delete'))),
                                );
                              });
                        },
                      ),
                    )
                  ],
                ),
                Container(
                  height: 300,
                  color: Colors.red,
                ),
                React()
              ],
            ),
          ),
        );
      },
    );
  }
}
