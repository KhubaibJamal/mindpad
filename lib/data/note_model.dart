import 'package:mind_pad/domain/entities/note_entities.dart';

class NoteModel {
  String id;
  String? title;
  String? description;
  int? createAt;

  NoteModel({
    required this.id,
    this.title,
    this.description,
    this.createAt,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      createAt: json["createAt"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'createAt': createAt,
    };
  }

  NoteModel copyWith({
    String? id,
    String? title,
    String? description,
    int? createAt,
  }) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createAt: createAt ?? this.createAt,
    );
  }

  NoteEntities toDomain() => NoteEntities(
        id: id,
        title: title,
        description: description,
        createAt: createAt,
      );
}
