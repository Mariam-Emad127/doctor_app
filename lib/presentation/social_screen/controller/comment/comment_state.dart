import 'package:equatable/equatable.dart';

import '../../data/comment_model.dart';

abstract class CommentState extends Equatable {
  const CommentState();
}

class CommentInitial extends CommentState {
  @override
  List<Object> get props => [];
}
class CommentLoading extends CommentState {
  @override
  List<Object> get props => [];
}

class CommentSucsess extends CommentState {
  final List<CommentModel > comments;
  CommentSucsess( {required this.comments});
  @override
  List<Object> get props => [ comments];
}

class CommentFailure extends CommentState {
  CommentFailure(String message);

  @override
  List<Object> get props => [];
}