<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
import 'package:doctor_app/core/service/notification.dart';
=======
 import 'package:doctor_app/presentation/onboarding/onboarding.dart';
>>>>>>> Stashed changes
=======
 import 'package:doctor_app/presentation/onboarding/onboarding.dart';
>>>>>>> Stashed changes
=======
 import 'package:doctor_app/presentation/onboarding/onboarding.dart';
>>>>>>> Stashed changes
import 'package:doctor_app/presentation/social_screen/controller/post_cubit.dart';
import 'package:doctor_app/presentation/social_screen/data/post_model.dart';
import 'package:doctor_app/presentation/social_screen/wedgit/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class React extends StatefulWidget {
  final postId;
  final Post? post;

  React({super.key, this.postId, this.post});

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

            setState(() {

            });
            ispressed = !ispressed;

          }),
      IconButton(
          icon: Icon(
            Icons.comment_outlined,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CommentScreen(postId: widget.postId,post: widget.post,)));
          }),
      IconButton(
        icon: Icon(
          Icons.send,
        ),
<<<<<<< Updated upstream
        onPressed: () async{
  await NotificationServics().sendNotification( "Hi",  "Welcome again");
=======
        onPressed: () async {
          // await NotificationServics().sendNotification( "Hi",  "Welcome again");
        //  context.read<NotificationCubit>()  ..sendlocalNotification("Hi", "Welcome again")..ForegroundNotification();
          //context.read<NotificationCubit>()..getAccessToken() ;
          //  ..sendlocalNotification("Hi", "Welcome again")..ForegroundNotification();
<<<<<<< Updated upstream
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes

        },
      ),
      Expanded(
          child: Align(
        alignment: Alignment.bottomRight,
        child: IconButton(
            icon: const Icon(Icons.bookmark_border), onPressed: () {}),
      )),
    ]);
  }
}
