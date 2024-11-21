import 'dart:html';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/presentation/social_screen/controller/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../data/post_model.dart';
import '../data/comment_model.dart';

class postCubit extends Cubit<postState> {
  postCubit() : super(postInitial());

  Future<void> uploadPost(
    String description,
    Uint8List? file,
    String uid,
    String username,
  ) async {
    try {
      emit(postLoading());
      String postId = Uuid().v4();
      Post? post;
      FirebaseFirestore.instance
          .collection("post")
          .doc(postId)
          .set(post!.toJson());
      emit(postSucess());
    } catch (e) {
      emit(postError(e.toString()));
      print(e.toString());
    }
  }

  // Future<void>getPost(){}
  // Future<void>likePost(){}
  Future<void> DelletePost(String postId) async {
    try {
      emit(postLoading());
      await FirebaseFirestore.instance.collection('post').doc(postId).delete();

      emit(postSucess());
    } catch (err) {
      emit(postError(err.toString()));
      // res = err.toString();
    }
  }

  Future<void> commentPost(String postId, String text, String uid, String name,
      String profilePic) async {
    try {
      emit(postLoading());
      String commentId = Uuid().v4();
      Comment? comment;
      //Comment comment=Comment();
      FirebaseFirestore.instance
          .collection("post")
          .doc(postId)
          .collection("comment")
          .doc(commentId)
          .set(comment!.toJson());
      emit(postSucess());
    } catch (e) {
      emit(postError(e.toString()));
      print(e.toString());
    }
  }
}
