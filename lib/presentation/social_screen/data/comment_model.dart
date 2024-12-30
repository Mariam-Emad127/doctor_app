import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel{
 final String postId;
 final String text;
 final String uid;
 final String name;
 final String profImage;
 //final  String postId;
 final  DateTime datePublished;

 CommentModel( {required this.postId,required this.datePublished,
    required this.text,
    required this.uid, required this.name, required this.profImage});

 Map<String,dynamic>toJson()=>{
   "text" : text,
   "uid": uid,
   "username": name,
   "postId": postId,
   "datePublished": DateTime.now(),
   "profilepic": profImage,

   //profImage: profImage,
 };
factory CommentModel.fromjson(QueryDocumentSnapshot<Map<String,dynamic>>data){
  //final data=json.data();
  return CommentModel(
      postId:data["postId"],
      text: data["text"],
      uid:data["uid"], name: data["username"],
      profImage: data["profImage"],
      //postId:data["required"],
      datePublished: data["datePublished"].toDate()
  );



}

}
