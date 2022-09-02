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

  factory Folder.fromJson(Map<String, dynamic> json) => Folder(
        id: json['id'] as int,
        title: json['title'] as String,
        itemCount: json['itemCount'] as int,
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'itemCount': itemCount,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };

  @override
  String toString() {
    return "id: $id; title: $title; itemCount: $itemCount; createdAt: $createdAt; updatedAt: $updatedAt";
  }
}
