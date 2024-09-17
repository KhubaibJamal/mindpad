class NoteEntities {
  String id;
  String? title;
  String? description;
  int? createAt;

  NoteEntities({
    required this.id,
    this.title,
    this.description,
    this.createAt,
  });

  NoteEntities.empty()
      : id = '',
        title = '',
        description = '',
        createAt = 0;
}
