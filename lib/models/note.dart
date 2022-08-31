import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

@JsonSerializable()
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

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  Map<String, dynamic> toJson() => _$NoteToJson(this);
}
