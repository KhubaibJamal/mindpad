import 'package:mind_pad/domain/entities/note_entities.dart';

class AddNoteState {
  final NoteEntities notes;
  final bool isLoading;
  final String? error;

  const AddNoteState({
    required this.notes,
    required this.isLoading,
    required this.error,
  });

  factory AddNoteState.initial() => AddNoteState(
        notes: NoteEntities.empty(),
        isLoading: false,
        error: '',
      );

  AddNoteState copyWith({
    NoteEntities? notes,
    bool? isLoading,
    String? error,
  }) =>
      AddNoteState(
        notes: notes ?? this.notes,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
      );
}
