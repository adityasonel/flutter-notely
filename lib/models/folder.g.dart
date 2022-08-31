// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Folder _$FolderFromJson(Map<String, dynamic> json) => Folder(
      id: json['id'] as int,
      title: json['title'] as String,
      itemCount: json['itemCount'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$FolderToJson(Folder instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'itemCount': instance.itemCount,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
