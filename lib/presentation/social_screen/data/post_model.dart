import 'package:cloud_firestore/cloud_firestore.dart';

class Post{
    final String ?description;
    final String uid;
    final  String postId;
    final  String ?photoUrl;
   final String username;
   final  String ?profImage;
   final  List<String> likes;
   final  DateTime datePublished;
    final num? totalLikes;
 // late  final  String postUrl;
  //final List< String> comment;

  Post(   {
    required this.description,
    required this.uid,
    required this.username,
    required this.likes,
    required this.postId,
    required this.datePublished,
    required this.totalLikes,
    required this.photoUrl,
    required this.profImage,
  }
      );




 factory Post.fromJson( QueryDocumentSnapshot< Map<String, dynamic>>json) {
    return Post(
      photoUrl: json['photoUrl']  ,
       description:json['description']??"",
       uid: json['uid'],
       username: json['username'] ,
       postId:json['postId'] ,
       datePublished: json['datePublished'].toDate() ,
       profImage:json["profImage"],
       likes: List.from(json["like"]).map((e) => e.toString()).toList(),
        totalLikes: json["totalLikes"]   ,
      // json["likes"],
        //comment:   json['comment']
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
  "likes":likes,
  "postId": postId,
  "datePublished": DateTime.now(),
  //"postUrl": postUrl,
  "photoUrl":photoUrl,
  "profImage": profImage,
   };


}





