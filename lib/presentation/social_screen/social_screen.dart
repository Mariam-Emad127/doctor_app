import 'package:flutter/material.dart';

class SocialScreen extends StatelessWidget {
    SocialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
body: Padding(
  padding: const EdgeInsets.all(10),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Row(children: [
      CircleAvatar(
        radius: 16,
        backgroundImage: NetworkImage(
          "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/813px-Unknown_person.jpg"),),
      SizedBox(width: 10,),
    Text( "Name"),
     SizedBox(width: 300,),
     Expanded(
       child: IconButton(
       icon: Icon(Icons.more_vert),
         onPressed: () {
            showDialog(context: context, builder:  (context){
             return Dialog(
               child:  InkWell(
                   onTap: () {},
                   child: Container(
                       padding: const EdgeInsets.symmetric(
                           vertical: 12, horizontal: 16),
                       child: Text('Delete')
                   )
               ),

             );

           });

         },



       ),
     )
    ],),
  Container(
    height: 300,
    color: Colors.red,

  ),


      Row(

          children: <Widget>[

            IconButton(
                icon:



                Icon(Icons.favorite,
                    color: Colors
                        .red),
                //     :
                // Icon(Icons.favorite,
                //     color: Colors
                //         .white),//: Icon(Icons.favorite, color: Colors.red)
                onPressed: () {

                }
            ),

            IconButton(
              icon: Icon(
                Icons.comment_outlined,
              ),
                    onPressed: (){}


              ),

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
                      icon: const Icon(Icons.bookmark_border), onPressed: () {}),
                )),
          ]),
  ],),
),



    );
  }
}
