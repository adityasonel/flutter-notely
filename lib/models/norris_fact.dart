import 'package:json_annotation/json_annotation.dart';

part 'norris_fact.g.dart';

@JsonSerializable()
class NorrisFact {
  String id;
  List<dynamic> categories;
  String iconUrl;
  String url;
  String value;
  String createdAt;
  String updatedAt;

  NorrisFact(
      {required this.id,
      required this.categories,
      required this.iconUrl,
      required this.url,
      required this.value,
      required this.createdAt,
      required this.updatedAt});

  factory NorrisFact.fromJson(Map<String, dynamic> json) =>
      _$NorrisFactFromJson(json);

  Map<String, dynamic> toJson() => _$NorrisFactToJson(this);
}
