import 'package:doctor_app/core/utils/string.dart';
import 'package:doctor_app/presentation/notes/data/models/note_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());

  addNote(NoteModel note) {
    emit(NoteLoading());
    try {
      var box = Hive.box<NoteModel>(AppStrings.boxname);
      box.add(note);
      emit(NoteSucess());
    } catch (e) {
      emit(NoteError(e.toString()));
    }
  }
}
