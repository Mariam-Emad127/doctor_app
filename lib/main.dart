import 'package:doctor_app/core/routing/app_router.dart';
import 'package:doctor_app/core/routing/routes.dart';
import 'package:doctor_app/core/utils/string.dart';
import 'package:doctor_app/presentation/auth/controller/auth_cubit.dart';
import 'package:doctor_app/presentation/notes/controller/cubit/note_cubit.dart';
import 'package:doctor_app/presentation/notes/data/models/note_model.dart';
import 'package:doctor_app/presentation/notes/data/note_type_adapter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
//await Hive.deleteBoxFromDisk(AppStrings.boxname);

  Hive.registerAdapter<NoteModel>(NoteTypeAdapter());
  await Hive.openBox<NoteModel>(AppStrings.boxname);
  //  Supabase.initialize(
  //  url: 'https://etnasuvxeixhssutzmyo.supabase.co',
  // anonKey:"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV0bmFzdXZ4ZWl4aHNzdXR6bXlvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI0ODIxMDksImV4cCI6MjA0ODA1ODEwOX0.vlqWr_ClfkHUJrGHTPEpY7FiJrVmtLjBbEmbmlgCpIk");

  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); 
  //  IO.Socket? socket;
  //  List<MessageModel>messageList=[];

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => NoteCubit()..fetchAllData())
        
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: Routes.noteScreen,
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
