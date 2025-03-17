<<<<<<< Updated upstream
<<<<<<< Updated upstream
 import 'package:doctor_app/presentation/auth/controller/auth_cubit.dart';
import 'package:doctor_app/presentation/auth/login.dart';
 import 'package:doctor_app/presentation/social_screen/controller/comment/comment_cubit.dart';
import 'package:doctor_app/presentation/social_screen/controller/post_cubit.dart';
 import 'package:doctor_app/presentation/user_profile/presentation/controller/profile_cubit.dart';
 import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'firebase_options.dart';
 void main() async{
=======
import 'package:doctor_app/core/routing/app_router.dart';
import 'package:doctor_app/core/routing/routes.dart';
import 'package:doctor_app/core/utils/string.dart';
import 'package:doctor_app/presentation/auth/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
=======
import 'package:doctor_app/core/routing/app_router.dart';
import 'package:doctor_app/core/routing/routes.dart';
import 'package:doctor_app/core/utils/string.dart';
import 'package:doctor_app/presentation/auth/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
>>>>>>> Stashed changes
 import 'package:supabase_flutter/supabase_flutter.dart';
 
import 'firebase_options.dart';
 void main() async {
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
  WidgetsFlutterBinding.ensureInitialized();
   await Supabase.initialize(
    url: 'https://etnasuvxeixhssutzmyo.supabase.co',
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV0bmFzdXZ4ZWl4aHNzdXR6bXlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI0ODIxMDksImV4cCI6MjA0ODA1ODEwOX0.vlqWr_ClfkHUJrGHTPEpY7FiJrVmtLjBbEmbmlgCpIk"
   );
  // Initialize the Firebase app
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
<<<<<<< Updated upstream
//OneSignal.Debug.setLogLevel(OSLogLevel.debug);
OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
 OneSignal.initialize("ab142e3d-47e0-4265-b514-138ef3a60c29");
OneSignal.Notifications.requestPermission(true);
  runApp(const MyApp());
=======

String ?s ;
 //s= await FirebaseMessaging.instance.getToken();
 print( "bbbbbbbbbbbbbb=$s");
 
 runApp(MyApp(appRouter: AppRouter(),));
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
}


class MyApp extends StatelessWidget {
  final AppRouter appRouter; 
  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
<<<<<<< Updated upstream
    return MultiBlocProvider(
      
      providers: [
        BlocProvider<AuthCubit>(create:  (context)=>AuthCubit( )),
        BlocProvider<postCubit>(create:  (context)=>postCubit() ),
        // BlocProvider(
        //     create: (context) => postCubit(
        //        // postRepository: FirebasePostRepository()
        //     )..add(getData())
        // ),
        BlocProvider<ProfileCubit>(create:  (context)=>ProfileCubit()),
        BlocProvider<CommentCubit>(create:  (context)=>CommentCubit())

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
      
        home:Loginin()
        //HomeScreen()
      //  Loginin()
       ),
    );
=======
=======
>>>>>>> Stashed changes
    return    MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
         // home:
              //Notificationscreen()
           //    HomeScreen()
             //Loginin()
             initialRoute: Routes.login,
             onGenerateRoute:appRouter.onGenerateRoute,
       );
    //);
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
  }
}



