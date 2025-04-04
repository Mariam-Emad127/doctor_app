import 'package:flutter/material.dart';

class ReplyCard extends StatelessWidget {
  const ReplyCard({super.key,
   required  this.message, required this.time
  })  ;
    final String message;
    final String time;

  //final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 13,
          maxWidth:200 ,
         // maxWidth: MediaQuery.of(context).size.width -4, //45,
          minHeight:6, 
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 50,
                  top: 5,
                  bottom: 10,
                ),
                child: Text(
                  message,
                   //message.message,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Text(time,
                  //message.time,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}