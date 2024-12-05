import 'dart:io';
import 'package:doctor_app/core/utils/string.dart';
import 'package:doctor_app/presentation/social_screen/controller/post_cubit.dart';
import 'package:doctor_app/presentation/social_screen/controller/post_state.dart';
import 'package:doctor_app/presentation/user_profile/data/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../user_profile/presentation/controller/profile_cubit.dart';
import 'data/post_model.dart';

class AddingPost extends StatefulWidget {
  AddingPost({super.key});

  @override
  State<AddingPost> createState() => _AddingPostState();
}

class _AddingPostState extends State<AddingPost> {
  TextEditingController postController = TextEditingController();
  File? file;
  bool isLoading = true;
  UserModed ?user;
  fettchUser()async{
    var userData=await ProfileCubit().getUserData();
    setState(() {
      user=  userData;

    });
  }

  picimage() async {
    var pickfile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      file = File(pickfile!.path);
    });
  }

  Post? post;
  String postId = Uuid().v4();
@override
  void initState() {
    // TODO: implement initState
    fettchUser();
  }
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
              InkWell(
                  onTap: () {
                    // postCubit().uploadPostImageToSupabase(
                    //     file: file!,
                    //     fileName: "posts/${file!.path.split("/").last} ",
                    //     postId: postId);
                    setState(() {});

                    postCubit().uploadPost(
                        postController.text.trim(),
                        FirebaseAuth.instance.currentUser!.uid,
                        postId,
                        file.toString() ,
                       //user!.username

                    );

                    Navigator.pop(context);
                  },
                  child: Text("Post   ",
                      style: TextStyle(color: Colors.blueAccent, fontSize: 17)))
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
                    child: file == null
                        ? Image.network(unknowmimage)
                        : Image.file(file!)),

                //network( file.path),

                Row(children: [
                  Expanded(
                      child: TextButton(
                    onPressed: () async {
                      setState(() {});
                      picimage();
                      setState(() {});
                      // postCubit().uploadPostImageToSupabase(
                      // fileName: "posts/${file!.path.split( "/").last} ",
                      // file: file,
                      //     postId: postId
                      // );
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
}
