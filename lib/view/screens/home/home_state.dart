import 'package:mind_pad/domain/entities/note_entities.dart';

class HomeState {
  final List<NoteEntities> notes;
  final bool isLoading;
  final String? error;

  const HomeState({
    required this.notes,
    required this.isLoading,
    required this.error,
  });

  factory HomeState.initial() =>
      const HomeState(notes: [], isLoading: false, error: '');

  HomeState copyWith({
    List<NoteEntities>? notes,
    bool? isLoading,
    String? error,
  }) =>
      HomeState(
        notes: notes ?? this.notes,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
      );
}
