import 'package:doctor_app/presentation/notes/controller/cubit/note_cubit.dart';
import 'package:doctor_app/presentation/notes/data/models/note_model.dart';
import 'package:doctor_app/presentation/notes/wedgit/add_word_dialog.dart';
import 'package:doctor_app/presentation/notes/wedgit/note_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  void initState() {
    setState(() {});
    BlocProvider.of<NoteCubit>(context).fetchAllData();
    super.initState();
  }

  List<NoteModel> notes = [];
  @override
  void didChangeDependencies() {
   // BlocProvider.of<NoteCubit>(context).fetchAllData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NoteCubit>(
      create: (context) => NoteCubit()..fetchAllData(),
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  context: context,
                  builder: (context) {
                    return const AddWordDialog();
                  });
            },
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
          appBar: AppBar(
            title: const Text("Notes"),
          ),
          body: Padding(
              padding: const EdgeInsets.all(10),
              //  if (state is NoteError) {}
              //if (state is NoteLoading) {
              // return CircularProgressIndicator();
              //}
              // if (state is NoteSucess) {
              //  BlocProvider.of<NoteCubit>(context).fetchAllData();
              //  Navigator.pop(context);
              //  }
              child: BlocConsumer<NoteCubit, NoteState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is NoteSucess) {
                    BlocProvider.of<NoteCubit>(context).fetchAllData();
                    notes = state.note;
                    return ListView.builder(
                        itemCount: notes.length,
                        itemBuilder: (BuildContext context, int index) =>
                            notes.isEmpty
                                ? Container()
                                : NoteItem(
                                    note: notes[index],
                                    //title: notes[index].title, subtitle: notes[index].subTitle,
                                  ));
                  } else if (state is NoteError) {
                    return Container(
                      color: Colors.white,
                    );
                  } else {
                    return Container(
                      color: Colors.white,
                    );
                  }
                },
              )

              //},
              )),
    );
  }
}
