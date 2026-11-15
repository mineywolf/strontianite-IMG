// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flathub_bundle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlathubBundleModel _$FlathubBundleModelFromJson(Map<String, dynamic> json) =>
    FlathubBundleModel(
      value: json['value'] as String,
      sdk: json['sdk'] as String,
      type: json['type'] as String,
      runtime: json['runtime'] as String,
    );

Map<String, dynamic> _$FlathubBundleModelToJson(FlathubBundleModel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'sdk': instance.sdk,
      'type': instance.type,
      'runtime': instance.runtime,
    };
