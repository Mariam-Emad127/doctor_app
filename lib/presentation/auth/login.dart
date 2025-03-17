 import 'package:doctor_app/core/routing/app_router.dart';
import 'package:doctor_app/core/routing/routes.dart';
import 'package:doctor_app/presentation/auth/signin.dart';
import 'package:doctor_app/presentation/auth/wedgit/iconButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'controller/auth_cubit.dart';
import 'controller/auth_state.dart';
import 'wedgit/textformfeild.dart';

class Loginin extends StatefulWidget {
  const Loginin({super.key});

  @override
  State<Loginin> createState() => _LogininState();
}

class _LogininState extends State<Loginin> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool isPass = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (BuildContext context, state) {
        if (state is AuthSucess) {
          Navigator.pushReplacementNamed(
              context,Routes.HomeScreen
               );
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
      builder: (BuildContext context, state) {
        if (state is AuthLoading) {
          return const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Form(
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
                      Textformfeild(
                        controller: _email,
                        hintText: "enter your email",
                        picon: Icon(Icons.email),
                        textInputType: TextInputType.text,
                        isPass: isPass,
                      ),
                      Textformfeild(
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
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              final email = _email.text.trim();
                              final password = _password.text.trim();

                              context
                                  .read<AuthCubit>()
                                  .SignInWithEmailAndPassword(
                                    email: email.trim(),
                                    password: password.trim(),
                                  );
                            }
                            // await AuthCubit().SignInWithEmailAndPassword(email: _email.text.trim(),
                            //   password: _password.text.trim() , );
                            //
                            // Navigator.of(context).push(MaterialPageRoute(builder:  (context)=>HomeScreen()) );
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
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SignUp(),
                              ),
                            ),
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
          );
        }
      },
    );
  }
}
