import 'package:doctor_app/presentation/social_screen/controller/comment/comment_cubit.dart';
import 'package:doctor_app/presentation/social_screen/controller/comment/comment_state.dart';
import 'package:doctor_app/presentation/social_screen/data/comment_model.dart';
import 'package:doctor_app/presentation/social_screen/data/post_model.dart';
import 'package:doctor_app/presentation/widget/circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Commentcard extends StatefulWidget {
  final Post? post;
  const Commentcard({super.key, required this.post});

  @override
  State<Commentcard> createState() => _CommentcardState();
}

class _CommentcardState extends State<Commentcard> {
  late List<CommentModel> comment;
  @override
  void initState() {
    BlocProvider.of<CommentCubit>(context).getComment(widget.post!.postId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentCubit, CommentState>(
      builder: (BuildContext context, state) {
        if (state is CommentSucsess) {
          //List <CommentModel>comment=state.comments;
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: ListView.builder(
              itemCount: state.comments.length,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(state.comments[index].profImage
                                //unknowmimage
                                //snap.data()['profilePic'],
                                ),
                        radius: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${state.comments[index].name}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                           
                            Text("${state.comments[index].text}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey))
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 200,
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return CircularProgress();
        }
      },
    );
    //centerTitle: false,

    //  );
  }
}
