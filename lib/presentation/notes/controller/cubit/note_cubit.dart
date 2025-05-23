import 'package:doctor_app/core/utils/string.dart';
import 'package:doctor_app/presentation/notes/data/models/note_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
 
part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial()); 

List<NoteModel> notes=[];
fetchAllData(){
  emit(NoteLoading());
var box= Hive.box<NoteModel>(AppStrings.boxname);
notes=box.values.toList();
  emit(NoteSucess(note: notes));

 }

  Future<void> addNote(NoteModel note)async {
    emit(NoteInitial());
    try {
      var box =  Hive.box<NoteModel>(AppStrings.boxname);
     emit(NoteLoading());
     await box.add(note);
     notes=box.values.toList();
       print('Saving note: ${note.title} - ${note.subTitle}');
       emit(AddNoteSucess());
     
    } catch (e) {
      emit(NoteError(e.toString()));
    }
  }


}
