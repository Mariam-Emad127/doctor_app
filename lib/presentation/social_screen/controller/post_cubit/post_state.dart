import 'package:equatable/equatable.dart';

import '../../data/post_model.dart';

abstract class postState extends Equatable{

  List<Object?> get props => [];
}

// ignore: camel_case_types
class postError extends  postState {
  final String message;
  postError(this.message);
}

// ignore: camel_case_types
class postInitial extends postState {}

// ignore: camel_case_types
class postLoading extends postState {}

// ignore: camel_case_types
class postSucess extends postState {
  final List<Post>posts;
   postSucess({required this.posts});
  @override
  List<Object?> get props => [posts];

}
