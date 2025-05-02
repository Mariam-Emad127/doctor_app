import 'package:doctor_app/core/utils/string.dart';
import 'package:doctor_app/presentation/user_profile/controller/profile_cubit.dart';
import 'package:doctor_app/presentation/user_profile/controller/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePhoto extends StatelessWidget {
 //final UserModed ?user;
  const ProfilePhoto({super.key,// required this.user
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getUserData(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {

          if (state is ProfileSucess) {
            return CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    state.user?.photoUrl ?? AppStrings.unknowmimage));
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
