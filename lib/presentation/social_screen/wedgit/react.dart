import 'package:flutter/material.dart';

class React extends StatelessWidget {
  const React({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(children: <Widget>[
      IconButton(
          icon: Icon(Icons.favorite, color: Colors.red),

          onPressed: () {}),
      IconButton(
          icon: Icon(
            Icons.comment_outlined,
          ),
          onPressed: () {}),
      IconButton(
        icon: Icon(
          Icons.send,
        ),
        onPressed: () {},
      ),
      Expanded(
          child: Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
                icon: const Icon(Icons.bookmark_border),
                onPressed: () {}),
          )),
    ]);
  }
}
