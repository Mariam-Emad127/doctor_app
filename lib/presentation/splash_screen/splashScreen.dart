import 'dart:async';
import 'package:doctor_app/presentation/onboarding/onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => OnBoardingScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Color(0xFF2260FF),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //assest\medical-records.svg
                  SvgPicture.asset("assest/medical-records.svg",color:  Colors.white),
                  SizedBox(height: 10,),
                  Text(
                    "My Doctor",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),

                ]),
          )),

      //),
    );
  }
}
