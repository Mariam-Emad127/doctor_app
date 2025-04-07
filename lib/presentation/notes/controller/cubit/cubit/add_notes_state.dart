part of 'add_notes_cubit.dart';

sealed class AddNotesState extends Equatable {
  const AddNotesState();
  @override
  List<Object> get props => [];
}

final class AddNotesInitial extends AddNotesState {}
final class NoteInitial extends AddNotesState {}
 class NoteLoading extends AddNotesState {}
 class NoteSucess extends AddNotesState {}
 class NoteError extends AddNotesState {
  final String message;
  const NoteError(this.message);
}