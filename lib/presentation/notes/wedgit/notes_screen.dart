
import 'package:doctor_app/presentation/notes/wedgit/add_word_dialog.dart';
import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _getFloationActionButton(context),
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body:const Padding(
        padding:  EdgeInsets.all(10),
        child:  Column(
          children: [
            Row(
              children: [
               // LanguageFilterWidget(),
                Spacer(),
                //FilterDialogButton(),
              ],
            ),
            SizedBox(height: 10,),
          //  Expanded(
            //  child: WordsWidget(),
            //),
          ],
        ),
      ),
    );
  }

 
  FloatingActionButton _getFloationActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      onPressed: () => showDialog(
        context: context,
        builder: (context) =>const AddWordDialog(), 
      ),
      child:const Icon(Icons.add,color: Colors.black,),
    );
  }

 
}