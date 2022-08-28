// ignore_for_file: non_constant_identifier_names

class NorrisFact {
  final String id;
  final List<dynamic> categories;
  final String icon_url;
  final String url;
  final String value;
  final String created_at;
  final String updated_at;

  const NorrisFact(
      {required this.id,
      required this.categories,
      required this.icon_url,
      required this.url,
      required this.value,
      required this.created_at,
      required this.updated_at});

  factory NorrisFact.fromJson(Map<String, dynamic> json) {
    return NorrisFact(
        id: json["id"],
        categories: json["categories"],
        icon_url: json["icon_url"],
        url: json["url"],
        value: json["value"],
        created_at: json["created_at"],
        updated_at: json["updated_at"]);
  }
}
