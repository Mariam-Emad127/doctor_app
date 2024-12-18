import 'package:cloud_firestore/cloud_firestore.dart';

class Post{
    final String ?description;
    final String uid;
    final  String postId;
    final  String ?photoUrl;
   final String username;
   final  String ?profImage;

   // late  final  List<String> likes;
 late  final  DateTime datePublished;
 // late  final  String postUrl;
 //late  final  String comment;

  Post(  {required this.description,
    required this.uid,
    required this.username,
    //required this.likes,
    required this.postId,
    required this.datePublished,
    //required this.postUrl,
    //required this.comment,
    required this.photoUrl,
    required this.profImage,
  }
      );


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

 factory Post.fromJson( QueryDocumentSnapshot< Map<String, dynamic>> json) {

   return Post(
      photoUrl: json['photoUrl']  ,//??"https://i.pinimg.com/736x/05/b4/fb/05b4fbc3f169175e6deb97b3977175b6.jpg",
       description:json['description']??"",
       uid: json['uid'],
       username: json['username'] ,
       //likes: likes,
       postId:json['postId'] ,
       datePublished: json['datePublished'].toDate() ,
       profImage:json["profImage"]
       //postUrl: json['postUrl'],
   //    comment:   json['comment']
   );
    // description = json['description']  ;
    // datePublished = json['datePublished'] ?? '';
    // postUrl = json['image'] ?? '';
    // username = json['ownerName'] ?? '';
    // photoUrl = json['ownerImage'] ?? '';
    // likes = List.from(json['likes']).map((e) => e.toString()).toList();
   // shares = json['shares'] ?? 0;
   // comment = List.from(json['comments']).map((e) => CommentDataModel.fromJson(e)).toList();
  }
//  }
Map<String,dynamic>toJson()=>{
  "description" :description,
  "uid": uid,
 // "username": username,
  //"likes":likes,
  "postId": postId,
  "datePublished": DateTime.now(),
  //"postUrl": postUrl,
  "photoUrl":photoUrl,
  "profImage": profImage,
   };


}





