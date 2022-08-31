// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'norris_fact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NorrisFact _$NorrisFactFromJson(Map<String, dynamic> json) => NorrisFact(
      id: json['id'] as String,
      categories: json['categories'] as List<dynamic>,
      iconUrl: json['iconUrl'] as String,
      url: json['url'] as String,
      value: json['value'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$NorrisFactToJson(NorrisFact instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categories': instance.categories,
      'iconUrl': instance.iconUrl,
      'url': instance.url,
      'value': instance.value,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
