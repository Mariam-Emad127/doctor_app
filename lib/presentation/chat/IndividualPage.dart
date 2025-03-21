import 'package:doctor_app/presentation/chat/controller/cubit/chat_cubit.dart';
import 'package:doctor_app/presentation/chat/widgets/own_message.dart';
import 'package:doctor_app/presentation/chat/widgets/send_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Individualpage extends StatefulWidget {
   const Individualpage({super.key,   });

  @override
  State<Individualpage> createState() => _IndividualpageState();
}

class _IndividualpageState extends State<Individualpage> {
    ScrollController _controller = ScrollController();
TextEditingController _textEditingController=TextEditingController();
    String name="llllllllllll";
   IO.Socket? socket;
@override
  void initState() {
    context.read<ChatCubit>().sendMessage();
    // TODO: implement initState
    super.initState();
  }
 
@override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Retrieve arguments here
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    setState(() {
      name = args?["name"] ?? "Unknown User";
    });
  }
 

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      appBar:  AppBar(
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
            Container(
              width: 200,//size.width * 0.60,
              child: Container(
                child: Text(
                name,
               // "${rcvdData?["name"]}",// 'Chat',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
 
 
 // NameChattingwith(Name: widget.name.toString()), 
      body: Stack(

        children: [
        //  NameChattingwith(Name:  "nnnnnnnn"),
          Positioned(
            top: 0,
            bottom: 60,
            width: 200,//size.width,
            child: ListView.builder(
              controller: _controller,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              reverse: true,
              cacheExtent: 1000,
              itemCount: 2,//messages.length,
              itemBuilder: (BuildContext context, int index) {
  return OwnMessageCard();
              },
            ),
          ),
         sendBubble(messageController: _textEditingController, onPressed:  (){})
        ],
      ),
    );
 
  }
}