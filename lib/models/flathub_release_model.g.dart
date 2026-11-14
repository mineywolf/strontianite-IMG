// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flathub_release_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlathubReleaseModel _$FlathubReleaseModelFromJson(Map<String, dynamic> json) =>
    FlathubReleaseModel(
      timestamp: json['timestamp'] as String,
      version: json['version'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$FlathubReleaseModelToJson(
  FlathubReleaseModel instance,
) => <String, dynamic>{
  'timestamp': instance.timestamp,
  'version': instance.version,
  'type': instance.type,
};
