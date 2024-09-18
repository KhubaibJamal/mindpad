import 'package:mind_pad/domain/entities/note_entities.dart';

class AddNoteInitialParams {
  final NoteEntities? note;
  final bool isEditMode;
  const AddNoteInitialParams({
    this.note,
    required this.isEditMode,
  });
}
