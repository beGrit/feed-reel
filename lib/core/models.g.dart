// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReelInfo _$ReelInfoFromJson(Map<String, dynamic> json) => _ReelInfo(
  id: json['id'] as String,
  videoUrl: json['videoUrl'] as String,
  title: json['title'] as String?,
  titleSub: json['titleSub'] as String?,
);

Map<String, dynamic> _$ReelInfoToJson(_ReelInfo instance) => <String, dynamic>{
  'id': instance.id,
  'videoUrl': instance.videoUrl,
  'title': instance.title,
  'titleSub': instance.titleSub,
};
