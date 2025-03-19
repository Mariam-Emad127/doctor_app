import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/presentation/user_profile/data/user.dart';
import 'package:equatable/equatable.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  Future<List<UserModed>> getUses() async {
    emit(ChatLoading());

    final documentSnapshot =
        await FirebaseFirestore.instance.collection('users').get();
       final contactList =
        documentSnapshot.docs.map((e) => UserModed.fromjson(e)).toList();
        emit(ChatUsersSucsess(Users: contactList));
        return contactList;
  }
}
