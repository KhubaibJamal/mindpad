import 'package:mind_pad/domain/entities/note_entities.dart';
import 'package:mind_pad/domain/repository/note_repository.dart';
import 'package:mind_pad/view/screens/add%20note%20screen/add_note_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  final NoteRepository noteRepository;

  AddNoteCubit(
    this.noteRepository,
  ) : super(AddNoteState.initial());

  Future<void> addNote(NoteEntities note) async {
    emit(state.copyWith(isLoading: true));
    try {
      await noteRepository.addNote(note);

      // final notes = await noteRepository.getAllNotes();

      emit(state.copyWith(notes: note, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: "ERROR WHITE ADDING NOTE", isLoading: false));
      print(e.toString());
    }
  }

  Future<void> updateNote(String id, NoteEntities note) async {
    emit(state.copyWith(isLoading: true));
    try {
      await noteRepository.updateNote(id, note);

      // final notes = await noteRepository.getAllNotes();

      emit(state.copyWith(notes: note, isLoading: false));
    } catch (e) {
      emit(
          state.copyWith(error: "ERROR WHITE UPDATING NOTE", isLoading: false));
      print(e.toString());
    }
  }
}
