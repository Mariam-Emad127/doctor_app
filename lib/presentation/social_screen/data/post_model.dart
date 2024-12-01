import 'package:cloud_firestore/cloud_firestore.dart';

class Post{
 late  final String description;
 late  final String uid;
 late  final String username;
 late  final  List<String> likes;
 late  final  String postId;
 late  final  DateTime datePublished;
 late  final  String postUrl;
 late  final  String ?photoUrl;
 late  final  String comment;

  Post(this.photoUrl, {required this.description,
    required this.uid, required this.username,
    required this.likes, required this.postId,
    required this.datePublished, required this.postUrl ,required this.comment});


  //
  // static Post fromSnap (DocumentSnapshot snap){
  //   var snapshot=snap.data() as  Map<String,dynamic>;
  //   return Post(
  //
  //       email: snapshot["email"]??"",
  //       uid: snapshot["uid"]??"",
  //       photoUrl: snapshot["photoUrl"]??"",
  //       username: snapshot["username"]??"",
  //
  //
  //   );

  Post.fromJson(Map<String, dynamic> json) {
    description = json['description']  ;
    datePublished = json['datePublished'] ?? '';
    postUrl = json['image'] ?? '';
    username = json['ownerName'] ?? '';
    photoUrl = json['ownerImage'] ?? '';
    likes = List.from(json['likes']).map((e) => e.toString()).toList();
   // shares = json['shares'] ?? 0;
   // comment = List.from(json['comments']).map((e) => CommentDataModel.fromJson(e)).toList();
  }
//  }
Map<String,dynamic>toJson()=>{
  "description" : description,
  "uid": uid,
  "username": username,
  "likes":likes,
  "postId": postId,
  "datePublished": DateTime.now(),
  "postUrl": postUrl,
  "photoUrl":photoUrl
  //profImage: profImage,
   };


}





