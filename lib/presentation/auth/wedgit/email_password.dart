import 'package:doctor_app/presentation/auth/controller/auth_cubit.dart';
import 'package:doctor_app/presentation/auth/wedgit/textformfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailPassword extends StatefulWidget {
    EmailPassword({super.key});

  @override
  State<EmailPassword> createState() => _EmailPasswordState();
}

class _EmailPasswordState extends State<EmailPassword> {
    bool isPass = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthCubit>().formKey,
      child:   Column(
      children: [
       
                    TextformfeildWidget(
                      controller: context.read<AuthCubit>().username,
                      hintText: "enter your userName",
                      textInputType: TextInputType.text,
                      isPass: isPass,
                       validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter password";
                          }
                          return null;
                        },
                    ),
                    TextformfeildWidget(
                      controller:context.read<AuthCubit>().email,
                      hintText: "enter your email",
                      picon: Icon(Icons.email),
                      textInputType: TextInputType.text,
                      isPass: isPass,
                       validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter password";
                          }
                          return null;
                        },
                    ),
                    TextformfeildWidget(
                      controller:context.read<AuthCubit>().password,
                      hintText: "enter your password",
                      sicon: IconButton(
                        icon: Icon(
                          isPass == false
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            isPass = !isPass;
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
                    TextformfeildWidget(
                      controller: context.read<AuthCubit>().password,
                      hintText: "comfirm your password",
                      sicon: IconButton(
                        icon: Icon(
                          isPass == false
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
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
                  
        
      ],
      
      ),
    );
  }
}