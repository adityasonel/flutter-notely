import 'package:json_annotation/json_annotation.dart';

part 'folder.g.dart';

@JsonSerializable()
class Folder {
  int id;
  String title;
  int itemCount;
  DateTime createdAt;
  DateTime updatedAt;

  Folder(
      {required this.id,
      required this.title,
      required this.itemCount,
      required this.createdAt,
      required this.updatedAt});

  factory Folder.fromJson(Map<String, dynamic> json) => _$FolderFromJson(json);

  Map<String, dynamic> toJson() => _$FolderToJson(this);
}
