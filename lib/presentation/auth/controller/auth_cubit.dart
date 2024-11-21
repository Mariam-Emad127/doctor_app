import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit():super (AuthInitial());

  Future<void>  createUserWithEmailAndPassword({required String email,
    required String password,
    required String username,

  })async {
    emit(AuthLoading());

    String res="sucsess";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty

      ){

        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        print(credential.user!.uid);

        await FirebaseFirestore.instance.collection( "users").doc(credential.user!.uid).set(
           {
           "username":username,
            "uid":credential.user!.uid,
           "email": email,
          //  "bio": bio,
          //  "photoUrl":photoUrl,
          //  "followers": [],
          //  "following": [],
          //
          //
          //
            }
           // user.toJson()
        );

        res = "success";
      }}
    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');

      }

      emit(AuthSucess());
    } catch (e) {
      emit(AuthError(e.toString()));
      print(e);
    }
  //  return res;
  }



  Future<void> SignInWithEmailAndPassword({required String email,required String password})async {
    String res = " sucsess";
    emit(AuthLoading());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword (
        email: email,
        password: password,
      );


      emit(AuthSucess());
      res = "success";
    } catch (e) {
      emit(AuthError(e.toString()));
      print(e);
     // return e.toString();
    }
   // return res;
  }




  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }


}