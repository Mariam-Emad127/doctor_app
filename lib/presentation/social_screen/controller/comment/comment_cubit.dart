import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/presentation/social_screen/controller/comment/comment_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/comment_model.dart';

class CommentCubit extends Cubit<CommentState>{
 late List <CommentModel>comments;
  CommentCubit(): super (CommentInitial());
// late List<CommentModel>comments;
  //String commentId = Uuid().v4();
  Future<void> updatecommentPost(String postId, String text,
      String username,String profImage ,
      String commentId) async {
    try {
 emit(CommentLoading());
      FirebaseFirestore.instance
          .collection("post")
          .doc(postId)
          .collection("comment")
          .doc(commentId)
          .set( {
        "uid": FirebaseAuth.instance.currentUser!.uid,
        "postId": postId,
        "datePublished": DateTime.now(),
        "username": username,
        "profImage": profImage,
        "text":text
 });
      emit(CommentSucsess(comments: comments));
    } catch (e) {
       emit(CommentFailure(e.toString()));
      print(e.toString());
    }
  }

 Future<void> deletecommentPost(String postId, String commentId)async{

    try {
      //final commentcollection =
       await FirebaseFirestore.instance
          .collection("post")
          .doc(postId)
          .collection("comment")
          .doc(commentId).delete();

     }catch(e){

      print(e);
    }

 }
Stream <List<CommentModel>>readcomment(String postId, ) {
  final commentcollection =FirebaseFirestore.instance
      .collection("post")
      .doc(postId)
      .collection("comment").orderBy("datePublished", descending: true);
  return commentcollection.snapshots().map( (convert)=>convert.docs.map((e)=>CommentModel.fromjson(e)).toList());
}
Future<void>getComment(String postId)async{
    try{
      emit(CommentLoading());
    final streamed=await readcomment(postId);
streamed.listen( (comments){
  emit(CommentSucsess(comments: comments));

});

    }
    catch(e){
      emit(CommentFailure(e.toString()));}



}

}