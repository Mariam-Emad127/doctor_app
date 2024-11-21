import 'package:doctor_app/presentation/auth/controller/auth_cubit.dart';

import 'package:flutter/material.dart';

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

@immutable
abstract class AuthState {}
class AuthSucess extends AuthState {}


