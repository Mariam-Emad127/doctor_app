class Post{
  final String description;
  final String uid;
  final String username;
  final List<String> likes;
  final String postId;
  final DateTime datePublished;
  final String postUrl;
  final String ?photoUrl;

  Post(this.photoUrl, {required this.description,
    required this.uid, required this.username,
    required this.likes, required this.postId,
    required this.datePublished, required this.postUrl});


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





