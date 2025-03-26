 import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/presentation/chat/data/models/message_model.dart';
import 'package:doctor_app/presentation/user_profile/data/user.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  // Dart client
  IO.Socket socket = IO.io("http://10.0.2.2:3000",
    //'http://localhost:3000',
  <String,dynamic>{
    "transports": ["websocket"],
    "autoConnect": true,});
  List<MessageModel> messages = [];

final String uid=FirebaseAuth.instance.currentUser!.uid; 
  Future<List<UserModed>> getUses() async {
    emit(ChatLoading());

    final documentSnapshot =
        await FirebaseFirestore.instance.collection('users').get();
       final contactList =
        documentSnapshot.docs.map((e) => UserModed.fromjson(e)).toList();
        emit(ChatUsersSucsess(users: contactList));
        return contactList;
  }

Future <void> connectDevice()async{

  //socket._sendMessage();
  socket.onConnect((_) {
    print('connect');
    socket.emit('signin', uid);
  });
  socket.on('event', (data) => print(data));
  socket.onDisconnect((_) => print('disconnect'));
  socket.on('fromServer', (_) => print(_));


}
 Future <void> sendMessage(String sender,String message,String reciver)async{
  emit(ChatLoading());
  MessageModel messageModel=MessageModel(msg: message,sender:sender ,reciver:reciver,type: "OwnMessage");


socket.emit("message" ,{
"type":"OwnMessage","sender": sender,"reciver":reciver,"message":message
});
messages.add(messageModel);
emit(ChatSucsess(message: messages));

 }

Future <void> reciveMessage()async{
socket.on("message" , handler)

}



}
