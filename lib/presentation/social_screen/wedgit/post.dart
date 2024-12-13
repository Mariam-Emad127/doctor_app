// import 'package:doctor_app/presentation/social_screen/controller/post_cubit.dart';
// import 'package:doctor_app/presentation/social_screen/controller/post_state.dart';
// import 'package:doctor_app/presentation/social_screen/wedgit/delete_post.dart';
// import 'package:doctor_app/presentation/social_screen/wedgit/react.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../data/post_model.dart';
//
// class PostScreen extends StatefulWidget {
//  // final
//
//  // final String profImage;
//  // final String description; final String photoUrl;
//  PostScreen({super.key, });
//
//   @override
//   State<PostScreen> createState() => _PostScreenState();
// }
//
// class _PostScreenState extends State<PostScreen> {
//  List<Post>  ?post;
//
//
// @override
//   void initState() {
//  // postData=widget.indexed;
//   BlocProvider.of<postCubit>(context).getData();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 500,
//       child: ListView.builder(
//           itemCount: post!.length,
//           itemBuilder: (context, index) {
//             return Column(
//               children: [
//                 Row(
//                   children: [
//                     CircleAvatar(
//                         radius: 16,
//                         backgroundImage: NetworkImage(
//                             post![index].profImage.toString())),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     // Text(username),
//                     SizedBox(
//                       width: 250,
//                     ),
//                     DeletePost()
//                   ],
//                 ),
//                 Text("${post![index].description.toString()}"),
//                 Container(
//                     height: 200,
//                     child: Image.network(
//                         post![index].photoUrl.toString())),
//                 React()
//               ],
//             );
//           }),
//     );
//   }
// }
