import 'package:doctor_app/core/routing/routes.dart';
import 'package:doctor_app/presentation/auth/wedgit/alreadyHaveAccount.dart';
import 'package:doctor_app/presentation/auth/wedgit/email_password.dart';
import 'package:doctor_app/presentation/auth/wedgit/iconButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'controller/auth_cubit.dart';
import 'controller/auth_state.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSucess) {
     Navigator.pushNamed(context, Routes.login);
        } else if (state is AuthError) {
        
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SvgPicture.asset("assest/medical-records.svg",height:100,
                color: const Color(0xFF2260FF)),
            const SizedBox(
              height: 20,
            ),
            Text("SignuP",
                style: const TextStyle(
                  color: Color(0xFF2260FF),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
            EmailPassword(),
            SizedBox(
              height: 10,
            ),
            Alreadyhaveaccount(),
            InkWell(
              onTap: () async {
                context.read<AuthCubit>().createUserWithEmailAndPassword(
                    email: context.read<AuthCubit>().email.text,
                    password: context.read<AuthCubit>().password.text,
                    username: context.read<AuthCubit>().username.text);
                if (context
                    .read<AuthCubit>()
                    .formKey
                    .currentState!
                    .validate()) {
                  Navigator.pushNamed(context, Routes.login);
                }
              },
              child: Button_icon(title: "Signin"),
            ),
          ],
        ),
      ),
    ));
  }
}
