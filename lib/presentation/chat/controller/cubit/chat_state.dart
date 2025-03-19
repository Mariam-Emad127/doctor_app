part of 'chat_cubit.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatState {}

 

 
class ChatLoading extends ChatState {
  @override
  List<Object> get props => [];
}

class ChatSucsess extends ChatState {
 // final List<CommentModel > comments;
 // CommentSucsess( {required this.comments});
  @override
  List<Object> get props => [  ];
}
class ChatUsersSucsess extends ChatState {
  final List<UserModed > Users;
  ChatUsersSucsess( {required this.Users});
  @override
  List<Object> get props => [  ];
}
class ChatFailure extends ChatState {
  ChatFailure(String message);

  @override
  List<Object> get props => [];
}