 import 'package:doctor_app/presentation/social_screen/controller/post_cubit/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 

class AddPostCubit extends Cubit<postState> {
  AddPostCubit() : super(postInitial());
}
