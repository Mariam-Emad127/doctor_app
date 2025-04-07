import 'package:doctor_app/core/utils/string.dart';
import 'package:doctor_app/presentation/notes/data/models/note_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

List<NoteModel> notes=[];
fetchAllData(){
var box= Hive.box<NoteModel>(AppStrings.boxname);
notes=box.values.toList();
print(notes);
}

}
