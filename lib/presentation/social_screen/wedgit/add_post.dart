import 'package:doctor_app/core/routing/routes.dart';
import 'package:doctor_app/presentation/social_screen/wedgit/textfeiledwedgit.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPost extends StatefulWidget {
  
    const AddPost({super.key, 
   });

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
String ?photoUrl="55";

Future getphoto()async{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
setState(() {
  photoUrl=  prefs.getString("photoUrl");
  //print(photoUrl);
});
}
@override
  void initState() {
getphoto();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        InkWell(
          onTap: () {
   
       Navigator.pushNamed(context, Routes.Profole_screen);
          },
          child: 
          
          CircleAvatar(
              radius: 20,
              backgroundImage:
              NetworkImage(photoUrl??""),
        ),
        
        ),
        SizedBox(
          width: 10,
        ),


              TextFeiledWedgit( ),

 
      ],
    );
  }
}
