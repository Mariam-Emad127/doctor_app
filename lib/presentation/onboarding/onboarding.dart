import 'package:doctor_app/presentation/auth/login.dart';
import 'package:doctor_app/presentation/onboarding/onboarding_list.dart';
import 'package:flutter/material.dart';
 
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller=PageController(initialPage: 0);
  int currentPage=0 ;
  final List<SlideList>list=[];
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);

  }

  @override
  Widget build(BuildContext context) {



    // int next( ){
    // int nextPage=++_currentPage;
    //  if(nextPage== list.length){
    //    nextPage=0;
    //
    //  }
    // return nextPage;
    //
    // }



    AnimatedContainer _buildDots({
      int? ind,required BuildContext context
    }) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          color: Color(0xFF2260FF),
        ),
        margin: const EdgeInsets.only(right: 5),
        height: 10,
        curve: Curves.easeIn,
        width: currentPage == ind ? 20 : 10,
      );
    }

    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // onTap:(){
              //   _controller.animateToPage(
              //       _currentPage+1, duration: Duration(milliseconds: 400), curve:  Curves.linear);
              //
              // } ,
      Expanded(
        //height: 800,
        child: PageView.builder(
            controller: _controller,

            onPageChanged: (val) {
              setState(() {
                currentPage = val;
              });
            },
            itemCount: content.length,
        itemBuilder: (context, index) {

         // if(currentPage+1>=content.length) {
         //Navigator.of(context).pushReplacement(MaterialPageRoute(builder:  (context)=>Loginin())) ;}
          //currentPage==0;



          return Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                const SizedBox(height: 50),
                SizedBox(
                  height: 400,
                  child: Image.asset(
                    content[index].assest,
                  ),
                ),
                Text(content[index].title,  style: Theme.of(context).textTheme.headlineMedium  ,),
                SizedBox(
                  width: 270,
                    child: Text(content[index].describtion,  style:TextStyle(color: Colors.grey,fontSize: 15),)),
                SizedBox(height: 100,),
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      content.length,
                      (int ind) => _buildDots(
                        ind: ind,context: context
                      ),
                    ),
                  ),
                ),

                InkWell(
                    onTap:() => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Loginin()

                    )
                    ),
                    child: Text("Skip"))
              ],
            ),
          );
        }),
      )
    ]
    ));
  }
}
