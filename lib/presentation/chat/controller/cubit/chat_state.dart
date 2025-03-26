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
 final List<MessageModel > message;
  const ChatSucsess( {required this.message});
  @override
  List<Object> get props => [  ];
}
class ChatUsersSucsess extends ChatState {
  final List<UserModed > users;
  const ChatUsersSucsess( {required this.users});
  @override
  List<Object> get props => [  ];
}
class ChatFailure extends ChatState {
 const  ChatFailure(String message);

  @override
  List<Object> get props => [];
}