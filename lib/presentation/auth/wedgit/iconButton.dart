import 'package:flutter/material.dart';

// ignore: camel_case_types
class Button_icon extends StatelessWidget {
  final String title;

  const Button_icon({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 45,
      width: 207,
      decoration: BoxDecoration(
      color:  Color(0xFF2260FF),
      borderRadius: BorderRadius.circular(17)),

     // color: Color(0xFF2260FF),
      child: Center(child: Text(title)),);
  }
}
