 
import 'package:doctor_app/core/utils/string.dart';
import 'package:doctor_app/presentation/social_screen/controller/post_cubit/post_cubit.dart';
import 'package:doctor_app/presentation/social_screen/controller/post_cubit/post_state.dart';
import 'package:doctor_app/presentation/social_screen/wedgit/add_post.dart';
import 'package:doctor_app/presentation/social_screen/wedgit/delete_post.dart';
import 'package:doctor_app/presentation/social_screen/wedgit/react.dart';
import 'package:doctor_app/presentation/user_profile/data/user.dart';
import 'package:doctor_app/presentation/user_profile/presentation/controller/profile_cubit.dart';
import 'package:doctor_app/presentation/widget/circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/post_model.dart';

class SocialScreen extends StatefulWidget {
  const SocialScreen({super.key});

  @override
  State<SocialScreen> createState() => _SocialScreenState();
}
class _SocialScreenState extends State<SocialScreen> {
  UserModed? user;
 late List<Post>post;
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
    context.read<postCubit>().getData();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<postCubit, postState>(
      builder: (context, state) {
        if (state is postLoading) {
          return CircularProgress();
        } else
          if (state is postSucess) {


          List<Post?>post = state.posts;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                       AddPost(
                  //photoUrl:AppStrings.unknowmimage //
                 photoUrl:  user?.photoUrl.toString()??AppStrings.unknowmimage,
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
                                        post[index]!.profImage.toString())),
                                SizedBox(
                                  width: 270,
                                ),
                             DeletePost()
            
            
                              ],
                            ),
                           // ( post[index].description.toString())!=null?
                            Align(
                                alignment: Alignment.topLeft ,
                                child: Text("${post[index]?.description.toString()}",style: TextStyle(fontSize: 25),)),
                                //:Text( ""),
            
                            (post[index]?.photoUrl!=null)?
                            SizedBox(
                               height: 370,
                               width:350,
            
                               child:Image.network( post[index]!.photoUrl??"" )
 
                            ):SizedBox(),
                            React(
                            postId:state.posts[index].postId,
                            post:state.posts[index],
                            )
                           ],
                        );
            
                     //PostScreen(post:post[index]!);
                      }),
                ),
              ],
            ),
          );
        }

        return Center(child: Text("Error"));
      },
    ));
  }
}
