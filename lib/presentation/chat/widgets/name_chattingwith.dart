import 'package:flutter/material.dart';

class NameChattingwith extends StatelessWidget {
  final String Name;
  const NameChattingwith({super.key, required this.Name});

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
            Container(
              width: 200,//size.width * 0.60,
              child: Container(
                child: Text(
                 Name,// 'Chat',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      );
 
  }
}