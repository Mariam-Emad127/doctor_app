import 'dart:io';
import 'package:doctor_app/core/utils/string.dart';
import 'package:doctor_app/presentation/social_screen/controller/post_cubit/post_cubit.dart';
import 'package:doctor_app/presentation/social_screen/controller/post_cubit/post_state.dart';
import 'package:doctor_app/presentation/user_profile/data/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:uuid/uuid.dart';
 import 'data/post_model.dart';

class AddingPost extends StatefulWidget {
  const AddingPost({super.key});

  @override
  State<AddingPost> createState() => _AddingPostState();
}

class _AddingPostState extends State<AddingPost> {
  TextEditingController postController = TextEditingController();
  File? file;
  bool isLoading = true;
  late UserModed user;

  Post? post;
  String postId = Uuid().v4();

  @override
  void initState() {
    super.initState();
   //  fettchUser();
  }
  @override
  void dispose() {
    postController.dispose();

    super.dispose();}
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<postCubit, postState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Add post',
            ),
            actions: [
              BlocListener<postCubit, postState>(
                  listener: (BuildContext context, state) {
                    if (state is postSucess) {}
                  },
                  child: InkWell(
                    onTap: () {
                      if (file != null) {
                        postCubit().uploadPostImageToSupabase(
                            file: file!,
                            fileName: "posts/${file!.path.split("/").last} ",
                            postId: postId);
                        setState(() {});

                        postCubit().uploadPost(
                            postController.text.trim(),
                            FirebaseAuth.instance.currentUser!.uid,
                            postId,
                            file != null ? file.toString() : null,
                            user.username,
                            user.photoUrl
                                .toString() 
                                
                            );
                        postCubit().uploadPost(
                            postController.text.trim(),
                            FirebaseAuth.instance.currentUser!.uid,
                            postId,
                            file != null ? file.toString() : null,
                            user.username,
                            user.photoUrl
                                .toString() 

                            );
                      }

                      Navigator.pop(context);
                    },
                    child: Text("Post   ",
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 17)),
                  ))
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                //Expanded(child:
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: postController,
                    maxLines: null, // Allows the field to expand vertically
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        hintText: 'Write your post here...',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: InputBorder.none),
                  ),
                ),
                //  ),
                Card(
                 child:  Image.network(AppStrings.unknowmimage)
                  /*
                    child: file == null
                        ? Image.network(
                            "https://i.pinimg.com/736x/05/b4/fb/05b4fbc3f169175e6deb97b3977175b6.jpg",
                            height: 300,
                          )
                        : Image.file(file!)
                        */
                        ),

                //network( file.path),

                Row(children: [
                  Expanded(
                      child: TextButton(
                    onPressed: () async {
                      setState(() {});
                      //postCubit().pickImage();
                     // picimage();
                     context.read<postCubit>().pickImage();
                     // setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.add,
                        ),
                        Text(
                          'Add photo',
                        ),
                      ],
                    ),
                  ))
                ])
              ],
            ),
          ),
        );
      },
    );
  }
/*
  fettchUser() async {
    var userData = await ProfileCubit().getUserData();
    setState(() {
      user = userData !;
    });
  }
*/
  //
 
}
