import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/presentation/chat/data/models/message_model.dart';
import 'package:doctor_app/presentation/user_profile/data/user.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
part 'chat_state.dart';
//     

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  // Dart client
  IO.Socket socket = IO.io(
      "http://10.0.2.2:3000",
       <String, dynamic>{
        "transports": ["websocket"],
        "autoConnect": true,
        'reconnection': true, // إعادة الاتصال تلقائيًا
         'timeout': 50000,
      });
  List<MessageModel> messages = [];
      String time=DateTime.now().toUtc().toString().substring(0, 16);

  final String uid = FirebaseAuth.instance.currentUser!.uid;
  Future<List<UserModed>> getUses() async {
    emit(ChatLoading());

    final documentSnapshot =
        await FirebaseFirestore.instance.collection('users').get();
    final contactList =
        documentSnapshot.docs.map((e) => UserModed.fromjson(e)).toList();
    emit(ChatUsersSucsess(users: contactList));
    return contactList;
  }

  /*
  void initSocket() {
    print('Connecting to chat service');

    socket = IO.io(
        "http://10.0.2.2:3000",
        //"http://localhost:3000",
        <String, dynamic>{
          'transports': ['websocket'],
          'autoConnect': true,
          'reconnection': true, // إعادة الاتصال تلقائيًا
          //'reconnectionAttempts': 5, // عدد المحاولات قبل التوقف
          'timeout': 50000,
        });

    socket.onConnectError((data) {
      print('Connection Error: $data');
    });
    socket.onError((data) {
      print('Error: $data');
    });
     socket.onDisconnect((data) {
      print('Connection Error: $data');
    });
    socket.connect();
    try {
      socket.onConnect((_) {
        print('connected to websocket 1');
      });
    } catch (e) {
      print('Errorrrrrrrrrrr: $e');
    }
socket.emit("signin", FirebaseAuth.instance.currentUser!.uid);

    socket.on('message', (msg)=> {
      print("111111111$msg"),
      messages.add(MessageModel.fromJson(msg)),
     
       emit(ChatSucsess(message: messages)),
    });
 
  }
*/
  
/*
  Future<void> sendMessage(
      String sender, String message, String reciver) async {
    emit(ChatLoading());
    MessageModel messageModel = MessageModel(
        msgContent: message, sender: sender, reciver: reciver, type: "OwnMessage");

    socket.emit("message", {
      "type": "OwnMessage",
      "sender": sender,
      "reciver": reciver,
      "message": message
    });
    messages.add(messageModel);
    emit(ChatSucsess(message: messages));
  }
*/

Future<void> sendMessage(
      String sender, String message, String reciver) async {
    MessageModel messageModel = MessageModel(
        msgContent: message, sender: sender, reciver: reciver, type: "OwnMessage", time: time);

    socket.emit("message", {
      "type": "OwnMessage",
      "sender": sender,
      "reciver": reciver,
      "message": message,
      'time': time
    });
         emit(ChatSucsess(message: messages));
      messages.add(messageModel);
    //});
  }

}
