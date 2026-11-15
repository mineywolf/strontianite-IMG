// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flathub_icon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlathubIconModel _$FlathubIconModelFromJson(Map<String, dynamic> json) =>
    FlathubIconModel(
      url: json['url'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$FlathubIconModelToJson(FlathubIconModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'type': instance.type,
    };
