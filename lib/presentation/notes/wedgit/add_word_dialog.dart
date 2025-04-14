import 'package:doctor_app/presentation/notes/controller/cubit/note_cubit.dart';
import 'package:doctor_app/presentation/notes/data/models/note_model.dart';
import 'package:doctor_app/presentation/notes/wedgit/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddWordDialog extends StatefulWidget {
  const AddWordDialog({super.key});

  @override
  State<AddWordDialog> createState() => _AddWordDialogState();
}

class _AddWordDialogState extends State<AddWordDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleContrlller = TextEditingController();
  TextEditingController subtitleContrlller = TextEditingController();
  //String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: AnimatedContainer(
        padding: const EdgeInsets.all(15),
        duration: const Duration(milliseconds: 750),
        child: SingleChildScrollView(
          child: Form(
              key: formKey,
              // autovalidateMode: autovalidateMode,
              child: Column(children: [
                const SizedBox(
                  height: 32,
                ),
                CustomTextField(
                  controller: titleContrlller,
                  // onSaved: (value) {   title = value;  },
                  hint: 'title',
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  controller: subtitleContrlller, //TextEditingController(),
                  // onSaved: (value) {subTitle = value; },
                  hint: 'content',
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 32,
                ),
              /*
                IconButton(
                  icon: const Icon(
                    Icons.dangerous,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<NoteCubit>().addNote(NoteModel(
                          title: titleContrlller.text.trim(),
                          subTitle: subtitleContrlller.text,
                          date: DateTime.now().toString()));
                      BlocProvider.of<NoteCubit>(context).fetchAllData();
                    }
                    setState(() {});
                  },
                )
              */
                  BlocBuilder<NoteCubit, NoteState>(
                    builder: (context, state) {
                      if (state is NoteSucess) {
                        return IconButton(
                          icon: const Icon(
                            Icons.dangerous,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<NoteCubit>().addNote(NoteModel(
                                  title: titleContrlller.toString(),
                                  subTitle: subtitleContrlller.toString(),
                                  date: DateTime.now().toString()));
                              setState(() {});
                            }
                          },
                        );
                      } else if (state is NoteLoading) {
                        return Text("88888888");
                      } else if (state is NoteError) {
                        return Text("88888888");
                      } else {
                        return Text("9999999");
                      }
                    },
                  )
               
               
               
              ])),
        ),
      ),
    );

    /*   
    return BlocProvider(
      create: (context) => NoteCubit(),
      child: BlocConsumer<NoteCubit, NoteState>(listener: (context, state) {
        if (state is NoteError) {}

        if (state is AddNoteSucess) {
          BlocProvider.of<NoteCubit>(context).fetchAllData();
          Navigator.pop(context);
        }
      }, builder: (context, state) {
        return Dialog(
          child: AnimatedContainer(
            padding: const EdgeInsets.all(15),
            duration: const Duration(milliseconds: 750),
            child: SingleChildScrollView(
              child: Form(
                  key: formKey,
                  // autovalidateMode: autovalidateMode,
                  child: Column(children: [
                    const SizedBox(
                      height: 32,
                    ),
                    CustomTextField(
                      controller: titleContrlller,
                     // onSaved: (value) {   title = value;  },
                      hint: 'title',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      controller: subtitleContrlller,//TextEditingController(),
                     // onSaved: (value) {subTitle = value; },
                      hint: 'content',
                      maxLines: 5,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    IconButton(
                            icon: const Icon(
                              Icons.dangerous,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<NoteCubit>().addNote(NoteModel(
                                    title:  titleContrlller.text.trim(),
                                    subTitle: subtitleContrlller.text,
                                    date: DateTime.now().toString()));
                              BlocProvider.of<NoteCubit>(context).fetchAllData();
                              }
                                 setState(() {});
                            },
                          )
                
                  ])),
            ),
          ),
        );
  
  
    }),
    );
 */
  }
}
 /*
                    BlocBuilder<NoteCubit, NoteState>(
                      builder: (context, state) {
                        if (state is NoteSucess) {
                          return IconButton(
                            icon: const Icon(
                              Icons.dangerous,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<NoteCubit>().addNote(NoteModel(
                                    title: title.toString(),
                                    subTitle: subTitle.toString(),
                                    date: DateTime.now().toString()));
                                setState(() {});
                              }
                            },
                          );
                        } else if (state is NoteLoading) {
                          return Text("88888888");
                        } else if (state is NoteError) {
                          return Text("88888888");
                        } else {
                          return Text("9999999");
                        }
                      },
                    )
                 */
                 
                 