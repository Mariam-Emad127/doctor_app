import 'package:doctor_app/presentation/notes/data/models/note_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NoteTypeAdapter extends TypeAdapter<NoteModel>{
  @override
  NoteModel read(BinaryReader reader) {
return NoteModel(title: reader.readString(), subTitle: reader.readString(), date: reader.readString());
  }

  @override
  // TODO: implement typeId
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, NoteModel obj) {
writer.writeString(obj.title);
writer.writeString(obj.subTitle);
writer.writeString(obj.date);


  }
}