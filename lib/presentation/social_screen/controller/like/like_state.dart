//
// File? image;
// ImagePicker? imagePicker;
//
// void pickImage() async {
//   final pickfile = await ImagePicker().pickImage(source: ImageSource.gallery);
//
//   if (pickfile != null) {
//     image = File(pickfile.path);
//   }
// }

// Future<Uri> uploadPic() async {
//
//   //Get the file from the image picker and store it
//   XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
//
//   //Create a reference to the location you want to upload to in firebase
//   Reference reference = _storage.ref().child("images/");
//
//   //Upload the file to firebase
//    UploadTask uploadTask = reference.putFile(file);
//
//   // Waits till the file is uploaded then stores the download url
//   Uri location = await uploadTask.downloadUrl;
//
//   //returns the download url
//   return location;
// }

//}

//   Future<String>profileImage(String childname,Uint8List file,)async{
//     final time=DateTime.now().microsecondsSinceEpoch;
//    var uid=FirebaseAuth.instance.currentUser!.uid;
//     // creating location to our firebase storage
//     Reference reference=
//     FirebaseStorage.instance.ref().child("childname/$uid") ;//.putData(file);
//
//     UploadTask uploadTask=reference.putData(file);
//     TaskSnapshot snapshot=await uploadTask;
//
//     String downloadUrl=await snapshot.ref.getDownloadURL();
//
// return downloadUrl;
//   }

//Future<Map<String, String>>
// Future<List<Post>> getData() async {
//   try {
//     emit(postLoading());
//     var querySnapshot =
//         await FirebaseFirestore.instance.collection("post").get();
//
//     var posts = await FirebaseFirestore.instance.collection("post").get();
//     postm = await posts.docs.map((e) => Post.fromJson(e)).toList();
//     print("mmpppppppppppppppppppmm");
//     emit(postSucess(posts: postm));
//     return postm!;
//   } catch (h) {
//     emit(postError(h.toString()));
//     print("555555555555552${h}");
//   }
//   return
//     postm;
// }
