import 'package:doctor_app/presentation/chat/controller/cubit/chat_cubit.dart';
import 'package:doctor_app/presentation/user_profile/data/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isShowUsers = false;
  List<UserModed> users = [];
  SearchController searchController = SearchController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Form(
          child: TextFormField(
            controller: searchController,
            decoration:
                const InputDecoration(labelText: 'Search for a user...'),
            onFieldSubmitted: (String _) {
              setState(() {
                isShowUsers = true;
              });
            },
          ),
        ),
      ),
     body: BlocBuilder<ChatCubit, ChatState>(builder: (context, state) {
        if (state is ChatLoading) {
          return CircularProgressIndicator();
        } else if (state is ChatUsersSucsess) {
          users = state.Users;
          return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(users[index].photoUrl ?? ""),
                    radius: 16,
                  ),
                  title: Text(users[index].username  
                      //  (snapshot.data! as dynamic).docs[index]['username'],
                      ),
                );
              });
        } else {
          return Text("Error");
        }
      }),
    );
  }
}
