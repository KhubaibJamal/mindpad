import 'package:mind_pad/domain/entities/note_entities.dart';

abstract class NoteRepository {
  Future<void> addNote(NoteEntities note);

  Future<List<NoteEntities>> getAllNotes();

  Future<void> updateNote(String id, NoteEntities note);

  Future<void> deleteNoteById(String id);
}
