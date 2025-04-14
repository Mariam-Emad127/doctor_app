 import 'package:hive_flutter/hive_flutter.dart';

 //lib\presentation\notes\data\models\note_model.dart
 class NoteModel extends HiveObject {
 final  String title;
 final String subTitle;
 final String date;
 

  NoteModel({
    required this.title,
    required this.subTitle,
    required this.date,
   });
}