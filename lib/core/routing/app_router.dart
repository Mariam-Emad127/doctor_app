import 'package:doctor_app/core/routing/routes.dart';
import 'package:doctor_app/presentation/Home_screen/HomeScreen.dart';
import 'package:doctor_app/presentation/auth/controller/auth_cubit.dart';
import 'package:doctor_app/presentation/auth/login.dart';
import 'package:doctor_app/presentation/auth/signin.dart';
import 'package:doctor_app/presentation/onboarding/onboarding.dart';
import 'package:doctor_app/presentation/social_screen/adding_post.dart';
import 'package:doctor_app/presentation/social_screen/controller/post_cubit/post_cubit.dart';
import 'package:doctor_app/presentation/social_screen/social_screen.dart';
import 'package:doctor_app/presentation/social_screen/wedgit/comment.dart';
import 'package:doctor_app/presentation/user_profile/presentation/controller/profile_cubit.dart';
import 'package:doctor_app/presentation/user_profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
   late String postId;

 // AppRouter({required this.postId});
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.HomeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => postCubit(),
            child: HomeScreen(),
          ),
        );
      case Routes.login:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AuthCubit(),
                  child: Loginin(),
                ));
      case Routes.signin:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AuthCubit(),
                  child: SignUp(),
                ));
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());

      case Routes.social_screen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => postCubit(),
                  child: SocialScreen(),
                ));
      case Routes.addingPost:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => postCubit(),
                  child: AddingPost(),
                ));
      case Routes.Profole_screen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ProfileCubit()..getUserData(),
                  child: Profile(uid: FirebaseAuth.instance.currentUser!.uid),
                ) 
                );

                //case Routes.comment_screen:
                //return MaterialPageRoute(builder:  (_)=>CommentScreen(postId: postId));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
