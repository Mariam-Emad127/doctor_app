import 'package:doctor_app/presentation/social_screen/controller/post_cubit.dart';
import 'package:doctor_app/presentation/social_screen/controller/post_state.dart';
import 'package:doctor_app/presentation/social_screen/wedgit/add_post.dart';
import 'package:doctor_app/presentation/social_screen/wedgit/delete_post.dart';
import 'package:doctor_app/presentation/social_screen/wedgit/react.dart';
  import 'package:doctor_app/presentation/user_profile/data/user.dart';
import 'package:doctor_app/presentation/user_profile/presentation/controller/profile_cubit.dart';
 import 'package:doctor_app/presentation/widget/circularProgress.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/post_model.dart';

class SocialScreen extends StatefulWidget {
  SocialScreen({super.key});

  @override
  State<SocialScreen> createState() => _SocialScreenState();
}
class _SocialScreenState extends State<SocialScreen> {
  UserModed? user;
  fettchUser() async {
    var userData = await ProfileCubit().getUserData();
    setState(() {
      user = userData;
    });
  }
  @override
  void initState() {
    super.initState();
    setState(() {});
    fettchUser();
    BlocProvider.of<postCubit>(context).getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<postCubit, postState>(
      builder: (context, state) {
        if (state is postLoading) {
          return CircularProgress();
        } else if (state is postSucess) {
          List<Post>? post = state.posts;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
           AddPost(
                    photoUrl: user!.photoUrl.toString(),
                  ),

                  Expanded(
                    child: ListView.builder(
                        itemCount: post.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                      radius: 16,
                                      backgroundImage: NetworkImage(
                                          post[index].profImage.toString())),

                                  SizedBox(
                                    width: 270,
                                  ),
                               DeletePost()


                                ],
                              ),
                              (post[index].description.toString())!=null?
                              Align(
                                  alignment: Alignment.topLeft ,
                                  child: Text("${post[index].description.toString()}",style: TextStyle(fontSize: 25),)):Text( ""),
                             // (post[index].photoUrl.toString())??
                              Container(
                                   height: 370,
                                 width:350,
                                  child: Image.network(
                          (post[index].photoUrl.toString() ) )),

                        //       )//:Container(height: 2,
                        //
                        //          child: Image.network(
                        // "https://i.pinimg.com/736x/05/b4/fb/05b4fbc3f169175e6deb97b3977175b6.jpg",height: 2,)
                        //
                        //   ),
                              React()
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
          );
        }

        return Container(child: Center(child: Text("Error")));
      },
    ));
  }
}
