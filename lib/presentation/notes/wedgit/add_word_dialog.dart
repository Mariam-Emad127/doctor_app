import 'package:doctor_app/presentation/notes/controller/cubit/note_cubit.dart';
import 'package:doctor_app/presentation/notes/data/models/note_model.dart';
import 'package:doctor_app/presentation/notes/wedgit/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddWordDialog extends StatefulWidget {
  const AddWordDialog({super.key});

  @override
  State<AddWordDialog> createState() => _AddWordDialogState();
}

class _AddWordDialogState extends State<AddWordDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleContrlller = TextEditingController();
  TextEditingController subtitleContrlller = TextEditingController();
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Dialog(
        child: AnimatedContainer(
          padding: const EdgeInsets.all(15),
          duration: const Duration(milliseconds: 750),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 32,
              ),
              CustomTextField(
                onSaved: (value) {
                  title = value;
                },
                hint: 'title',
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                controller: subtitleContrlller,
                onSaved: (value) {
                  subTitle = value;
                },
                hint: 'content',
                maxLines: 5,
              ),
              const SizedBox(
                height: 32,
              ),
              BlocBuilder<NoteCubit, NoteState>(
                builder: (context, state) {
                  if(state is NoteSucess){     return Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(13)),
                    child: InkWell(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            var currentDate = DateTime.now();

                            var formattedCurrentDate =
                                DateFormat('dd-mm-yyyy').format(currentDate);

                            var noteModel = NoteModel(
                              title: title!,
                              subTitle: subTitle!,
                              date: formattedCurrentDate,
                            );

                            BlocProvider.of<NoteCubit>(context)
                                .addNote(noteModel);

                            BlocProvider.of<NoteCubit>(context)
                                .fetchAllData( );

                            Navigator.pop(context);
                          }
                          setState(() {});
                        },
                        child: Text(
                          "save",
                          style: TextStyle(color: Colors.blueAccent),
                        )),
                  );
              
              
              
               }
               else{return Container();}
              },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
