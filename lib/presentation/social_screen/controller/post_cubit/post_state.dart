import 'package:equatable/equatable.dart';

import '../../data/post_model.dart';

abstract class postState extends Equatable{

  List<Object?> get props => [];
}

class postError extends  postState {
  final String message;
  postError(this.message);
}

class postInitial extends postState {}

class postLoading extends postState {}

class postSucess extends postState {
  final List<Post>posts;
   postSucess({required this.posts});
  @override
  List<Object?> get props => [posts];

}
