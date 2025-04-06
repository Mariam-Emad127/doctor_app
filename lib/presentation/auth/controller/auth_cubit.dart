import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
 import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit():super (AuthInitial());
  final formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController username = TextEditingController();


  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  }) async {
    emit(AuthLoading()); // Emitting loading state
   // String res = "success"; // Default result message

    try {
      // Check if any of the fields are empty
      if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty) {
        // Create user with Firebase Authentication
        final UserCredential credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

//        print('User ID: ${credential.user!.uid}'); // Print UID for debugging

        // Save additional user data in Firestore
        await FirebaseFirestore.instance
            .collection("users")
            .doc(credential.user!.uid)
            .set({
          "username": username,
          "uid": credential.user!.uid,
          "email": email,
          // Add other fields if needed
        });

        emit(AuthSucess()); // Emit success state
      } else {
        throw Exception('All fields are required.');
      }
    } on FirebaseAuthException catch (e) {
      // Handle FirebaseAuth-specific errors
      if (e.code == 'weak-password') {
       // print('The password provided is too weak.');
        emit(AuthError('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        //print('The account already exists for that email.');
        emit(AuthError('The account already exists for that email.'));
      } else {
        print(e.message);
        emit(AuthError(e.message ?? 'An unknown error occurred.'));
      }
    } catch (e) {
      // Handle general errors
      print('Error: $e');
      emit(AuthError(e.toString()));
    }
  }


  // ignore: non_constant_identifier_names
  Future<void> SignInWithEmailAndPassword({required String email,required String password})async {
     emit(AuthLoading());
    try {
 //UserCredential userCredential = await 
  FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSucess());
      } catch (e) {
     // print("2222222222222222222222$e");
      emit(AuthError(e.toString()));
  
    }
   }



  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }


}