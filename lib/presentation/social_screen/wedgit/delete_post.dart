import 'package:flutter/material.dart';

class DeletePost extends StatelessWidget {
  const DeletePost({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: IconButton(
        icon: Icon(Icons.more_vert),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: InkWell(
                      onTap: () {},
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          child: Text('Delete'))),
                );
              });
        },
      ),
    );
  }
}
