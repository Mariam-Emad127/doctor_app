import 'package:doctor_app/presentation/notes/controller/cubit/note_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/note_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key, 
  required this.note
  }) : super(key: key);
//final String title;

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return GestureDetector(
      onTap: () {
      /*
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return EditNoteViewBody(
              note: note,
            );
          }),
        );
*/
      },
      child: Container(
        decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.only(left: 16, top: 24, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                "hhh${note.title}",
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.black,
=======
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
   
        },
        child: Container(
          decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(16),
             border: Border.all(color: Colors.blue)
          ),
          padding: const EdgeInsets.only(left: 16, top: 20, bottom: 24 , ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                 "${note.title}",
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    note.subTitle,
                    style: TextStyle(
                      fontSize: 18,
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(.4),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    note.delete();
      
                    BlocProvider.of<NoteCubit>(context).fetchAllData();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.blueAccent,
                    size: 30,
                  ),
>>>>>>> Stashed changes
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  note.subTitle,
                  style: TextStyle(
                    fontSize: 18,
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(.4),
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();

                  BlocProvider.of<NoteCubit>(context).fetchAllData();
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                note.date,
                style: TextStyle(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(.4),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}