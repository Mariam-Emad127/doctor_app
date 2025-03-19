import 'package:doctor_app/presentation/user_profile/data/user.dart';
import 'package:flutter/material.dart';

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}

class ProfileInitial extends ProfileState {}

class ProfieLoading extends ProfileState {}

@immutable
abstract class ProfileState {}
class ProfileSucess extends ProfileState {
final UserModed? user;

  ProfileSucess({required this.user});


}
