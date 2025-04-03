// ignore: file_names
import 'package:doctor_app/core/utils/color.dart';
import 'package:doctor_app/core/utils/global_variable.dart';
import 'package:flutter/material.dart';

import '../../core/routing/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  //late
   PageController pageController = PageController();

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }
 
 

 

  void navigate(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
        body: PageView(
          controller: pageController,
          children: GlobalVariable,
          onPageChanged: onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: mobileprimarycolor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                 color: (_page == 0) ? Colors.white : Colors.grey,
              ),
              label: '',
              backgroundColor: mobileprimarycolor,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.medical_information,
                color: (_page == 1) ? Colors.white : Colors.grey,
              ),
              label: '',
              backgroundColor: mobileprimarycolor,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                color: (_page == 2) ? Colors.white : Colors.grey,
              ),
              label: '',
              backgroundColor: mobileprimarycolor,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.perm_identity,
                color: (_page == 3) ? Colors.white : Colors.grey,
              ),
              label: '',
              backgroundColor: mobileprimarycolor,
            ),
          ],
          onTap:  (index){
  switch(index){
      case 0:
        Navigator.pushNamed(context, Routes.social_screen);
        break;
      case 1:
        Navigator.pushNamed(context, "/second");
          case 2:
                  Navigator.pushNamed(context, Routes.chat);
        break;
         
    }
 },
          currentIndex: _page,
        ));
  }
}
