import 'package:doctor_app/presentation/chat/data/models/message_model.dart';
import 'package:doctor_app/presentation/chat/widgets/ReplyCard.dart';
import 'package:doctor_app/presentation/chat/widgets/own_message.dart';
import 'package:doctor_app/presentation/chat/widgets/send_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Individualpage extends StatefulWidget {
  const Individualpage({
    super.key,
  });

  @override
  State<Individualpage> createState() => _IndividualpageState();
}

class _IndividualpageState extends State<Individualpage> {
     ScrollController _controller=ScrollController(); 
  final TextEditingController _textEditingController = TextEditingController();
  String recname = "llllllllllll";
  String reciver = "llllllllllll";
  String senderUid = FirebaseAuth.instance.currentUser!.uid;
  String time = DateTime.now().toUtc().toString().substring(11,16);
  late IO.Socket socket;

  List<MessageModel> messageList = [];
  // "http://192.168.1.100:3000",  // أضف "http://"
  // "http://10.0.2.2:3000",
  //"http://127.0.0.1:3000",



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
    setState(() {});
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

    socket.on(
        'message',
        (msg) => {
              print("111111111$msg"),
              setState(() {
                // MessagesModel.
                messageList.add(MessageModel.fromJson(msg));
                     _controller.animateTo(_controller.position.maxScrollExtent,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      
              })
            });
    /*
    socket.on(
      "message",
        (msg) => {
              print("connected messageServer"),
              print("222222222$msg"),
              setState(() {
               messageList.add(MessageModel(
                    type: msg["type"], msgContent: msg["massege"], sender: msg["sender"], reciver: msg['reciver']));
              }),
               
            });
  */
  }

  Future<void> sendMessage(
      String sender, String message, String reciver) async {
    MessageModel messageModel = MessageModel(
        msgContent: message,
        sender: sender,
        reciver: reciver,
        type: "OwnMessage",
        time: time);

    socket.emit("message", {
      "type": "OwnMessage",
      "sender": sender,
      "reciver": reciver,
      "message": message,
      'time': time
    });
    setState(() {
      messageList.add(messageModel);
  
    });
  }
 
  @override
  void initState() {
    super.initState();
    initSocket();
    //_controller.animateTo( _controller.position.maxScrollExtent, duration: Duration(milliseconds: 500), // ⏳ مدة الحركة
      //curve: Curves.easeOut,); 
  /*
   WidgetsBinding.instance.addPostFrameCallback((_) => {
          _controller.animateTo(
            0.0,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
          )
   });
   */
    //context.read<ChatCubit>().initSocket();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Retrieve arguments here
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    setState(() {
      recname = args?["recname"] ?? "Unknown User";
      reciver = args?["reciver"] ?? "Unknown User";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 200, //size.width * 0.60,
              child: Text(
                recname,
                style: TextStyle(fontSize: 15, color: Colors.white),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
              top: 0,
              bottom: 60,
              width: 200, //size.width,
              child: ListView.builder(
                controller: _controller,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                reverse: true,
                cacheExtent: 1000,
                itemCount: messageList.length,
                itemBuilder: (BuildContext context, int index) {
                  //if (messageList[index].type == "OwnMessage") {
                  if (messageList[index].sender == senderUid) {
                    //OwnMessage
                    return OwnMessageCard(
                        message: messageList[index].msgContent, time:messageList[index].time,);
                  } else if (messageList[index].type == "othermessage") {
                    return ReplyCard(
                      message: messageList[index].msgContent,
                      time:messageList[index].time
                    );
                  } else {
                    return null;
                  }
                },
              )),
          sendBubble(
              messageController: _textEditingController,
              onPressed: () async {
                // context.read<ChatCubit>().sendMessage(  FirebaseAuth.instance.currentUser!.uid, _textEditingController.text, reciver) ;
              _controller.animateTo(_controller.position.maxScrollExtent,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
                await sendMessage(FirebaseAuth.instance.currentUser!.uid,
                    _textEditingController.text, reciver);
                _textEditingController.clear();
               }),
        ],
      ),
    );
  }
}

          //  }else{}
                
        /*    
            BlocBuilder<ChatCubit, ChatState>(

              builder: (context, state) {
                
                if(state is ChatFailure){
                  return Text( "Error");
                }else if(state is ChatSucsess){
                  messageList=state.message;

                return ListView.builder(
                  controller: _controller,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  reverse: true,
                  cacheExtent: 1000,
                  itemCount: messageList.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (messageList[index].type=="OwnMessage"){    
                        return OwnMessageCard(message: messageList[index].msg );}
              else{return ReplyCard(message:messageList[index].msg,);}

                  },
                );}else{
                 
                  return Container();
                }
              },
            ),
        
        */
 