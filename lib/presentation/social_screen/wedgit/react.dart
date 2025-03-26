import 'package:doctor_app/presentation/social_screen/controller/comment/comment_cubit.dart';
import 'package:doctor_app/presentation/social_screen/controller/post_cubit/post_cubit.dart';
import 'package:doctor_app/presentation/social_screen/data/post_model.dart';
import 'package:doctor_app/presentation/social_screen/wedgit/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class React extends StatefulWidget {
  final postId;
  final Post? post;

 const React({super.key, this.postId, this.post});

  @override
  State<React> createState() => _ReactState();
}

class _ReactState extends State<React> {
  bool ispressed = false;

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      IconButton(
          icon: ispressed == false
              ? Icon(Icons.favorite, color: Colors.grey)
              : Icon(Icons.favorite, color: Colors.red),
          onPressed: () {
            BlocProvider.of<postCubit>(context).likePost(widget.postId);

            setState(() {});
            ispressed = !ispressed;
          }),
      IconButton(
          icon: Icon(
            Icons.comment_outlined,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BlocProvider(
                      create: (context) => CommentCubit()..readcomment( widget.postId),
                      child: CommentScreen(
                        postId: widget.postId,
                        post: widget.post,
                      ),
                    )));
          }),
      IconButton(
        icon: Icon(
          Icons.send,
        ),
        onPressed: () {},
      ),
      /*
         onPressed: () async{
  await NotificationServics().sendNotification( "Hi",  "Welcome again");
         onPressed: () async {
          // await NotificationServics().sendNotification( "Hi",  "Welcome again");
        //  context.read<NotificationCubit>()  ..sendlocalNotification("Hi", "Welcome again")..ForegroundNotification();
          //context.read<NotificationCubit>()..getAccessToken() ;
          //  ..sendlocalNotification("Hi", "Welcome again")..ForegroundNotification();
 
        },
      ),
    
    */
      Expanded(
          child: Align(
        alignment: Alignment.bottomRight,
        child: IconButton(
            icon: const Icon(Icons.bookmark_border), onPressed: () {}),
      )),
    ]);
  }
}
