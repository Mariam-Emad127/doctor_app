import 'package:flutter/material.dart';

class NameChattingwith extends StatelessWidget {
  final String name;
  const NameChattingwith({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return 
    AppBar(
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 200,//size.width * 0.60,
              child: Text(
               name,// 'Chat',
                style: TextStyle(fontSize: 15, color: Colors.white),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      );
 
  }
}