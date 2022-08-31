class Note {
  final int id;
  final String content;
  final String folder;
  final bool isAddedToTrash;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Note(
      {required this.id,
      required this.content,
      required this.folder,
      required this.isAddedToTrash,
      required this.createdAt,
      required this.updatedAt});

  @override
  List<Object> get props =>
      [id, content, folder, createdAt, updatedAt, isAddedToTrash];
}
