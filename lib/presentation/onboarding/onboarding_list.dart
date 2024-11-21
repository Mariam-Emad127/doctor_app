import 'package:flutter/material.dart';

class SlideList {
  //extends StatelessWidget {
  final String assest;
  final String title;
  final String describtion;


  SlideList({ required this.assest, required this.title,required this.describtion});
}

  List <SlideList>content= [
    SlideList(assest:  "assest/on_boarding/4195.jpg", title:  "Medical Record",describtion: "you can save your Data "),
    SlideList(assest:  "assest/on_boarding/6549.jpg", title:  "Recommondation doctor",describtion: "you can find best doctor in Egypt according to visita Rate"),
    //SlideList(assest:  "assest/on_boarding/3713399.jpg", title:  "",describtion: ""),
    SlideList(assest:  "assest/on_boarding/3768868.jpg", title:  "inspiring",describtion: "444"),
    SlideList(assest:  "assest/on_boarding/1.png", title:  "communcation",describtion: "55"),
    SlideList(assest:  "assest/on_boarding/2.png", title:  "Question",describtion: "444"),
  ];


//}
//
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//         //assest\on_boarding\1.jpeg
//       Image.asset(assest),
//
//       SizedBox(height: 30,),
//
//       Text(text)
//
//
//       ]),
//
//
//
//     );
//   }
//
// }

