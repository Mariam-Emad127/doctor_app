part of 'note_cubit.dart';

sealed class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object> get props => [];
}

final class NoteInitial extends NoteState {}
 class NoteError extends NoteState {
  final String message;
  const NoteError(this.message);
}

 class NoteLoading extends NoteState {}

 class NoteSucess extends NoteState {
  final List<NoteModel>note;
  const NoteSucess({required this.note});
 

}
 class AddNoteSucess extends NoteState {}

