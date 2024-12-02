

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModed {
  final String email;
  final String uid;
  final String ?photoUrl;
  final String username;


  UserModed({required this.email,
    required this.uid,
    required this.photoUrl,
    required this.username,


  });


  Map<String, dynamic> toJson() => {
    "username": username,
    "uid": uid,
    "email": email,
    "photoUrl": photoUrl,

  };
  //static UserfromSnap (DocumentSnapshot snap){
  factory UserModed.fromjson( DocumentSnapshot<  Map<String,dynamic>>json){

      final data = json.data() ;
      return UserModed(
        email: data!["email"]  ,
        uid: data["uid"] ,
        photoUrl: data["photoUrl"]  ??"",
        username: data["username"]  ,
      );
    }



  }



