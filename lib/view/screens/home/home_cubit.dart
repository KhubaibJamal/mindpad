import 'package:mind_pad/domain/repository/note_repository.dart';
import 'package:mind_pad/view/screens/add%20note%20screen/add_note_initial_params.dart';
import 'package:mind_pad/view/screens/home/home_navigator.dart';
import 'package:mind_pad/view/screens/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final NoteRepository noteRepository;
  final HomeNavigator homeNavigator;

  HomeCubit(
    this.noteRepository,
    this.homeNavigator,
  ) : super(HomeState.initial()) {
    getAllNote();
  }

  Future<void> getAllNote() async {
    emit(state.copyWith(isLoading: true));
    try {
      final notes = await noteRepository.getAllNotes();

      notes.sort((a, b) => b.createAt!.compareTo(a.createAt!));
      print(notes);

      emit(state.copyWith(notes: notes, isLoading: false));
    } catch (e) {
      emit(
          state.copyWith(error: "ERROR WHITE GETTING NOTES", isLoading: false));
      print("ERROR WHITE GETTING NOTES: $e");
    }
  }

  Future<void> deleteNote(String id) async {
    emit(state.copyWith(isLoading: true));
    try {
      await noteRepository.deleteNoteById(id);

      final notes = await noteRepository.getAllNotes();

      emit(state.copyWith(notes: notes, isLoading: false));
    } catch (e) {
      emit(
          state.copyWith(error: "ERROR WHITE DELETING NOTE", isLoading: false));
      print(e.toString());
    }
  }

  addNoteOnTap(AddNoteInitialParams initialParams) =>
      homeNavigator.pushToAddNoteScreen(initialParams);
}
