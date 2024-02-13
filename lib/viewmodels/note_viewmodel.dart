import 'package:mvvm_notes_app/models/note.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesViewModel extends Cubit<List<Note>> {
  NotesViewModel() : super([]);

  void addNote(Note note) {
    state.add(note);
    emit(List.from(state));
  }

  void updateNote(int index, Note note) {
    state[index] = note;
    emit(List.from(state));
  }

  void deleteNote(int index) {
    state.removeAt(index);
    emit(List.from(state));
  }

}