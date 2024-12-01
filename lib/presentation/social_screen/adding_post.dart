import 'package:flutter/material.dart';

class AddingPost extends StatelessWidget {
    AddingPost({super.key});
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add post',
        ),
        actions: [
  Text( "Post   ",style: TextStyle(color: Colors.blueAccent,fontSize: 17))

        ],
      ),
     body:
     Padding(
       padding: EdgeInsets.all(10),
       child: Column(
         children: [
           Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: nameController,
                  maxLines: null, // Allows the field to expand vertically
                  keyboardType: TextInputType.multiline,
                   decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                     hintText: 'Write your post here...',
       
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: InputBorder.none


       
                  ),
                ),
              ),
            ),

    Row(
    children: [
    Expanded(
    child: TextButton(
    onPressed: () {},
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
    Icon(
    Icons.add,
    ),
    Text(
    'Add photo',
    ),
    ],
    ),
    )
    )])

         ],
       ),
     ),

    );
  }
}
