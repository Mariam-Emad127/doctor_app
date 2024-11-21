import 'package:doctor_app/core/utils/color.dart';
import 'package:doctor_app/core/utils/global_variable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  late PageController pageController;

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  void initState() {
     pageController = PageController();
  }

  void navigate(int page) {
    pageController.jumpToPage(page);
  }

  @override
  void dispose() {
    //  pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Home"),
        // ),
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
                // size:  (_page == 0) ?25:15,
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
          onTap: navigate,
          currentIndex: _page,
        ));
  }
}
