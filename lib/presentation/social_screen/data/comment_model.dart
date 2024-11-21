class Comment{
 final String postId;
 final String text;
 final String uid;
 final String name;
 final String profilePic;

 Comment({required this.postId,
    required this.text,
    required this.uid, required this.name, required this.profilePic});

 Map<String,dynamic>toJson()=>{
   "text" : text,
   "uid": uid,
   "username": name,
   "postId": postId,
   "datePublished": DateTime.now(),
   "profilepic": profilePic,

   //profImage: profImage,
 };


}