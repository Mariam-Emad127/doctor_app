import '../data/post_model.dart';

abstract class postState{}

class postError extends  postState {
  final String message;
  postError(this.message);
}

class postInitial extends postState {}

class postLoading extends postState {}

class postSucess extends postState {
    Post? post;
 // postSucess();
}
