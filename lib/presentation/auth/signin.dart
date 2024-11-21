import 'package:doctor_app/presentation/auth/login.dart';
import 'package:doctor_app/presentation/auth/wedgit/iconButton.dart';
import 'package:doctor_app/presentation/auth/wedgit/textformfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../Home_screen/HomeScreen.dart';
import 'controller/auth_cubit.dart';
import 'controller/auth_state.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _username = TextEditingController();

  bool isPass=false;

  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<AuthCubit, AuthState>(

      // builder: (BuildContext context,   state) {  },
      listener: (BuildContext context,  state) {
        if (state is AuthSucess) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Loginin(),
              ));
        } else if (state is AuthError) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Warning"),
                content: const Text("Invalid email or password"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Try again"),
                  ),
                ],
              );
            },
          );
        }
      },
      builder: (BuildContext context,   state) {
        if (state is AuthLoading) {
          return const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }else {
          return Scaffold(

            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
              
                  children: [

                    SizedBox(height: 150,),
                    SvgPicture.asset("assest/medical-records.svg",color:  Color(0xFF2260FF)),
                    SizedBox(height: 20,),
                    Text( "SignUP",style: TextStyle(color:Color(0xFF2260FF) ,fontSize: 30 ,
                      fontWeight: FontWeight.bold, )),
                    Textformfeild(  controller: _username,hintText: "enter your userName",
                      textInputType: TextInputType.text, isPass: isPass,),
                    Textformfeild(  controller: _email,hintText: "enter your email",
                      picon:Icon(Icons.email),
                      textInputType: TextInputType.text, isPass: isPass,),
                    Textformfeild(  controller: _password,hintText: "enter your password",
                      sicon:  IconButton (icon:Icon( isPass==false? Icons.visibility_off : Icons.visibility,),
                        onPressed: () {
                           setState(() {
                            isPass = !isPass;

                          });  }, ),
                      textInputType: TextInputType.text, isPass: isPass,),
                    Textformfeild(  controller: _password,hintText: "comfirm your password",
                      sicon:  IconButton (icon:Icon( isPass==false? Icons.visibility_off : Icons.visibility,),
                        onPressed: () {
                          setState(() {
                            isPass = !isPass;//? true :false;

                          });  }, ),
                      textInputType: TextInputType.text, isPass: isPass,),
                    SizedBox(height: 50,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: const Text(
                            'Already have an account?',
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Loginin(),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: const Text(
                              ' Login.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                   InkWell(onTap:()async{
                    // BlocConsumer<AuthCubit>()
   await AuthCubit().createUserWithEmailAndPassword(email: _email.text.trim(),
    password: _password.text.trim(), username: _username.text.trim(), );

   Navigator.of(context).push(MaterialPageRoute(builder:  (context)=>Loginin()) );

                   } ,child:  Button_icon(title: "Signin"),),


                  ],
              
                ),
              ),
            ),


          );
        }
      },
    );

  }
}
