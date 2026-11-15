// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flathub_content_rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlathubContentRatingModel _$FlathubContentRatingModelFromJson(
  Map<String, dynamic> json,
) => FlathubContentRatingModel(
  contentRatingSystem: json['contentRatingSystem'] as String,
  minimumAge: (json['minimumAge'] as num).toInt(),
  minimumAgeText: json['minimumAgeText'] as String,
);

Map<String, dynamic> _$FlathubContentRatingModelToJson(
  FlathubContentRatingModel instance,
) => <String, dynamic>{
  'contentRatingSystem': instance.contentRatingSystem,
  'minimumAge': instance.minimumAge,
  'minimumAgeText': instance.minimumAgeText,
};
