// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoModel _$VideoModelFromJson(Map json) => VideoModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      subtitle: json['subtitle'] as String?,
      urlImage: json['urlImage'] as String?,
      urlVid: json['urlVid'] as String?,
    );

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'subtitle': instance.subtitle,
      'urlImage': instance.urlImage,
      'urlVid': instance.urlVid,
    };
