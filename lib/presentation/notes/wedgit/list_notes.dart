/*
import 'package:doctor_app/presentation/notes/controller/cubit/note_cubit.dart';
import 'package:doctor_app/presentation/notes/data/models/note_model.dart';
import 'package:doctor_app/presentation/notes/wedgit/note_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ListNotes extends StatelessWidget {
    ListNotes({super.key});
List<NoteModel>notes=[];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit,NoteState>(
      builder: (BuildContext context,   state) {
if(state is NoteLoading){
  return CircularProgressIndicator();
}
else if(state is NoteSucess){
  notes=state.note;
    return ListView.builder(
      itemCount: notes.length,
        itemBuilder: (BuildContext context, int index) =>
     notes.isEmpty?   Container( ) :   NoteItem(note: notes[index])
      
       
      
      );
}
   else if(state is NoteError){return Container(color: Colors.white,); }


      else{return Container(color: Colors.white,); }

        },
 );


  }
}

*/