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

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json['id'] as int,
        content: json['content'] as String,
        folder: json['folder'] as String,
        isAddedToTrash: json['isAddedToTrash'] as bool,
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'content': content,
        'folder': folder,
        'isAddedToTrash': isAddedToTrash,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };
}
