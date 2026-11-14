// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flathub_screenshots_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlathubScreenshotsModel _$FlathubScreenshotsModelFromJson(
  Map<String, dynamic> json,
) => FlathubScreenshotsModel(
  screenshots: (json['screenshots'] as List<dynamic>)
      .map((e) => FlathubScreenshotModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  caption: json['caption'] as String?,
  isDefault: json['isDefault'] as bool?,
);

Map<String, dynamic> _$FlathubScreenshotsModelToJson(
  FlathubScreenshotsModel instance,
) => <String, dynamic>{
  'screenshots': instance.screenshots.map((e) => e.toJson()).toList(),
  'caption': instance.caption,
  'isDefault': instance.isDefault,
};
