import 'package:flutter/material.dart';

import '../adding_post.dart';

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
        child: TextField(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddingPost()));
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
    );
  }
}
