import 'package:doctor_app/presentation/social_screen/controller/comment/comment_cubit.dart';
 import 'package:doctor_app/presentation/social_screen/wedgit/commentcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:uuid/uuid.dart';

import '../data/post_model.dart';

class CommentScreen extends StatefulWidget {
  final String postId;
  final Post ?post;
  const CommentScreen({super.key, required this.postId, this.post,  });

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  String commentId = Uuid().v4();

  final TextEditingController commentEditingController =
  TextEditingController();
     // Post? post;
  @override
  void initState() {
    
 BlocProvider.of<CommentCubit>(context).getComment(widget.postId);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
commentEditingController.dispose();
    super.dispose();}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Comments',
        ),
      ),
    body: BlocProvider<CommentCubit>(create: (BuildContext context) {return CommentCubit();  },
    child: Commentcard(post: widget.post,)),



      bottomNavigationBar: SafeArea(child:
      Container(
        height: kToolbarHeight,
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom),
        padding: const EdgeInsets.only(left: 16, right: 8),
        child: Row(children: [
        CircleAvatar(
        backgroundImage: NetworkImage(
          widget.post!.profImage.toString()
      // unknowmimage
          // user.photoUrl,
        ),

        radius: 18,
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: TextField(
            controller: commentEditingController,
            decoration: InputDecoration(
              hintText: 'Comment as ${widget.post!.username}',
              border: InputBorder.none,

            ),
          ),
        ),
      ),

      InkWell(
        onTap: () async {

    BlocProvider.of<CommentCubit>(context).updatecommentPost(
        widget.post!.postId,
        //post!.postId
        commentEditingController.text,
       widget.post!.username,
       widget.post!.profImage.toString(),
        commentId) ;
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: 8, horizontal: 8),
          child: const Text(
            'Post',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
     ] )
    )
    ),
    );
  }
}
