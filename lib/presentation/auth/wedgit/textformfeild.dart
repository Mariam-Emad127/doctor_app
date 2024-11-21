import 'package:flutter/material.dart';

class Textformfeild extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final bool isPass ;
  final Icon? picon;
  final IconButton? sicon;
        Function? onpress;
    Textformfeild(
      {super.key,
     // required this.title,
      required this.controller,
      required this.hintText,
      required this.textInputType,
      this.picon,
      this.sicon,
      this.onpress, required this.isPass});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13),
      child: Container(
        height: 50,
        width: 350,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            // enabledBorder: const OutlineInputBorder(
            //   borderSide: const BorderSide(color: Color(0xFF2260FF),  ),
            // ),
            focusedBorder:   OutlineInputBorder(
              borderRadius: BorderRadius.circular(16) ,
              borderSide: const BorderSide(color: Color(0xFF2260FF),  ),
            ),

            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            prefixIcon: picon,
            suffixIcon: sicon,

          ),
          //),
          obscureText: isPass,
        ),
      ),
    );
  }
}
