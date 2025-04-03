import 'package:doctor_app/core/routing/routes.dart';
import 'package:doctor_app/presentation/auth/controller/auth_state.dart';
 import 'package:doctor_app/presentation/auth/wedgit/iconButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'controller/auth_cubit.dart';
import 'wedgit/textformfeild.dart';

class Loginin extends StatefulWidget {
  const Loginin({super.key});

  @override
  State<Loginin> createState() => _LogininState();
}

class _LogininState extends State<Loginin> {
  final _formKey = GlobalKey<FormState>();
 final TextEditingController _email = TextEditingController();
 final TextEditingController _password = TextEditingController();
  bool isPass = false;

  @override
  Widget build(BuildContext context) {




           return Scaffold(
            body:  BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSucess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Login Successful"), backgroundColor: Colors.green),
              );
               // الانتقال إلى الشاشة التالية
//              Navigator.pushReplacementNamed(context, Routes.HomeScreen);
                Navigator.pushReplacementNamed(context, Routes.chat);

            } else if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text( state.message), backgroundColor: Colors.red),
              );
            }
            else if (state is AuthLoading) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(  "loading"), backgroundColor: Colors.blue),
              );
            }
          },
            
            
            
            
         child:     Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300,
                      ),
                      //Center(child:
                      SvgPicture.asset("assest/medical-records.svg",
                          color: Color(0xFF2260FF)),
                      TextformfeildWidget(
                        controller: _email,
                        hintText: "enter your email",
                        picon: Icon(Icons.email),
                        textInputType: TextInputType.text,
                        isPass: isPass,
                           validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter email";
                          }
                          return null;
                        },
                      ),
                      TextformfeildWidget(
                        controller: _password,
                        hintText: "enter your password",
                        sicon: IconButton(
                          icon: Icon(
                            isPass == false
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            // isPass==false ? true :false;
                            setState(() {
                              isPass = !isPass; //? true :false;
                            });
                          },
                        ),
                        textInputType: TextInputType.text,
                        isPass: isPass,
                                 validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter password";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                         /*
                            await  context
                                  .read<AuthCubit>()
                                  .SignInWithEmailAndPassword(
                                    email: _email.text,
                                    password: _password.text,
                                  );

                                   Navigator.pushReplacementNamed(context, Routes.HomeScreen);
                           */
                           BlocProvider.of<AuthCubit>(context).SignInWithEmailAndPassword(
                                    email: _email.text.trim(),
                                    password: _password.text.trim(),
                                  );
                            }
                            // await AuthCubit().SignInWithEmailAndPassword(email: _email.text.trim(),
                            //   password: _password.text.trim() , );
                            //
                            //
                          },
                          child: Button_icon(title: "Login")),
                      SizedBox(
                        height: 150,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: const Text(
                              'Dont have an account?',
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(context, Routes.signin),
                       
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: const Text(
                                ' Signup.',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
           ));
     
     
  }



}
