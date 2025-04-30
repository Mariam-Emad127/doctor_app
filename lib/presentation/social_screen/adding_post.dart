import 'dart:io';
import 'package:doctor_app/presentation/social_screen/controller/post_cubit/post_cubit.dart';
import 'package:doctor_app/presentation/social_screen/controller/post_cubit/post_state.dart';
import 'package:doctor_app/presentation/user_profile/data/user.dart';
import 'package:doctor_app/presentation/user_profile/presentation/controller/profile_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
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
    String path="";
  Post? post;
  String postId = Uuid().v4();

  @override
  void initState() {
    super.initState();
    fettchUser();
  }

  @override
  void dispose() {
    postController.dispose();

    super.dispose();
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
              BlocListener<postCubit, postState>(
                  listener: (BuildContext context, state) {
                    if (state is postSucess) {}
                  },
                  child: InkWell(
                    onTap: () async{
                      if (file != null) {
                        /*
                      await  postCubit().uploadPostImageToSupabase(
                            file:file!,
                           fileName: "posts",
                           //{path.split("/").last}",

                            //fileName: "posts/${file!.path.split("/").last} ",
                            postId: postId);
                        setState(() {});
*/
                        postCubit().uploadPost(
                           file!,
                           "posts",
                            postController.text.trim(),
                            FirebaseAuth.instance.currentUser!.uid,
                            postId,
                            user.username,
                            user.photoUrl??""
                            );//.toString()
                        postCubit().uploadPost(
                            file!,
                           "posts",
                            postController.text.trim(),
                            FirebaseAuth.instance.currentUser!.uid,
                            postId,
                            user.username,
                            user.photoUrl.toString());
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
                    child: path ==  ""
                        ? Image.network(
                            "https://i.pinimg.com/736x/05/b4/fb/05b4fbc3f169175e6deb97b3977175b6.jpg",
                            height: 300,
                          )
                        : Image.file(File(path),height: 200,)
 
                    ),

 
                TextButton(
                  onPressed: () async {
                    setState(() {});
                    await pickImage();

                    setState(() {});
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
                )
              ],
            ),
          ),
        );
      },
    );
  }

  fettchUser() async {
    var userData = await ProfileCubit().getUserData();
    setState(() {
      user = userData!;
    });
  }


  Future<void> pickImage() async {
    final pickfile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickfile != null)  {
        File image=File(pickfile.path) ;
          //final image=pickfile.readAsBytes() ;
 
       file =   image;
      setState(() {
        
      });
      path = pickfile.path;
    }
   // return file!;
  }
}
