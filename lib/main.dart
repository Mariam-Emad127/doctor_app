import 'package:doctor_app/core/routing/app_router.dart';
import 'package:doctor_app/core/routing/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
 
import 'firebase_options.dart';
 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: 'https://etnasuvxeixhssutzmyo.supabase.co',
      anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV0bmFzdXZ4ZWl4aHNzdXR6bXlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI0ODIxMDksImV4cCI6MjA0ODA1ODEwOX0.vlqWr_ClfkHUJrGHTPEpY7FiJrVmtLjBbEmbmlgCpIk");
      //AppStrings.supabasekey);
  // Initialize the Firebase app
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

 
 


 
  runApp(MyApp(appRouter: AppRouter(),));
}
 
class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
       return    MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
   
             initialRoute: Routes.login,
             onGenerateRoute:appRouter.onGenerateRoute,
       );
  }
}
