import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mind_pad/data/note_model.dart';
import 'package:mind_pad/domain/entities/note_entities.dart';
import 'package:mind_pad/domain/repository/note_repository.dart';

class NoteService implements NoteRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addNote(NoteEntities note) async {
    try {
      var docId = _firestore.collection('events').doc();

      NoteModel noteModel = NoteModel(
        id: docId.id,
        title: note.title,
        description: note.description,
        createAt: DateTime.now().millisecondsSinceEpoch,
      );

      await _firestore
          .collection('notes')
          .doc(docId.id)
          .set(noteModel.toJson());
    } catch (e) {
      print("Failed to add note: $e");
    }
  }

  @override
  Future<List<NoteEntities>> getAllNotes() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('notes').get();

      List<NoteEntities> notes = querySnapshot.docs
          .map((doc) => NoteModel.fromJson(doc.data() as Map<String, dynamic>)
              .copyWith(id: doc.id)
              .toDomain())
          .toList();

      notes.sort((a, b) => b.createAt!.compareTo(a.createAt!));

      return notes;
    } catch (e) {
      print("Failed to get notes: $e");
      return [];
    }
  }

  @override
  Future<void> updateNote(String id, NoteEntities note) async {
    try {
      NoteModel noteModel = NoteModel(
        id: id,
        title: note.title,
        description: note.description,
        createAt: DateTime.now().millisecondsSinceEpoch,
      );

      await _firestore
          .collection('notes')
          .doc(note.id)
          .update(noteModel.toJson());
    } catch (e) {
      print("Failed to update note: $e");
    }
  }

  @override
  Future<void> deleteNoteById(String id) async {
    try {
      await _firestore.collection('notes').doc(id).delete();
    } catch (e) {
      print("Failed to delete note: $e");
    }
  }
}
