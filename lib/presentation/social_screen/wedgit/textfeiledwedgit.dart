import 'package:flutter/material.dart';

import '../../../core/routing/routes.dart';
 
class TextFeiledWedgit extends StatefulWidget {
  const TextFeiledWedgit({super.key});

  @override
  State<TextFeiledWedgit> createState() => _TextFeiledWedgitState();
}

class _TextFeiledWedgitState extends State<TextFeiledWedgit> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return   Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 8),
        child: Container(
          decoration: BoxDecoration(
           // borderRadius: BorderRadius.all(Radius.circular(10)),

            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
              //  offset: Offset(0, 3), // changes position of shadow
              ),
            ],

          ),
          child: TextField(
            onTap: () {
              Navigator.pushNamed(context,  Routes.addingPost);
             // of(context).push(MaterialPageRoute( builder: (context) => AddingPost()));
            },
            controller: nameController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusColor: Colors.white,
              hintText: 'What Do Yoy Think  ',
              hintStyle: const TextStyle(color: Colors.grey),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(30),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                    color: Colors.white, width: 2.0),
              ),


            ),


          ),
        ),
      ),
    );
  }
}
