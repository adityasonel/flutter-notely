class Fact {
  String id;
  String iconUrl;
  String url;
  String value;
  String createdAt;
  String updatedAt;

  Fact(
      {this.id = "",
      this.iconUrl = "",
      this.url = "",
      this.value = "",
      this.createdAt = "",
      this.updatedAt = ""});

  factory Fact.fromJson(Map<String, dynamic> json) => Fact(
        id: json['id'] as String,
        iconUrl: json['icon_url'] as String,
        url: json['url'] as String,
        value: json['value'] as String,
        createdAt: json['created_at'] as String,
        updatedAt: json['updated_at'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'iconUrl': iconUrl,
        'url': url,
        'value': value,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
