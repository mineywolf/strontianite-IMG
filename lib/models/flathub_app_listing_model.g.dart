// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flathub_app_listing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlathubAppListingModel _$FlathubAppListingModelFromJson(
  Map<String, dynamic> json,
) => FlathubAppListingModel(
  type: json['type'] as String,
  id: json['id'] as String,
  name: json['name'] as String,
  summary: json['summary'] as String?,
  description: json['description'] as String?,
  developerName: json['developerName'] as String?,
  icon: json['icon'] as String?,
  icons: (json['icons'] as List<dynamic>?)
      ?.map((e) => FlathubIconModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  screenshots: json['screenshots'] == null
      ? null
      : FlathubScreenshotsModel.fromJson(
          json['screenshots'] as Map<String, dynamic>,
        ),
  releases: (json['releases'] as List<dynamic>?)
      ?.map((e) => FlathubReleaseModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  urls: (json['urls'] as List<dynamic>?)
      ?.map((e) => Map<String, String>.from(e as Map))
      .toList(),
  categories: (json['categories'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  keywords: (json['keywords'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  projectLicense: json['projectLicense'] as String?,
  isFreeLicense: json['isFreeLicense'] as bool?,
  isMobileFriendly: json['isMobileFriendly'] as bool?,
  isEol: json['isEol'] as bool?,
);

Map<String, dynamic> _$FlathubAppListingModelToJson(
  FlathubAppListingModel instance,
) => <String, dynamic>{
  'type': instance.type,
  'id': instance.id,
  'name': instance.name,
  'summary': instance.summary,
  'description': instance.description,
  'developerName': instance.developerName,
  'icon': instance.icon,
  'icons': instance.icons?.map((e) => e.toJson()).toList(),
  'screenshots': instance.screenshots?.toJson(),
  'releases': instance.releases?.map((e) => e.toJson()).toList(),
  'urls': instance.urls,
  'categories': instance.categories,
  'keywords': instance.keywords,
  'projectLicense': instance.projectLicense,
  'isFreeLicense': instance.isFreeLicense,
  'isMobileFriendly': instance.isMobileFriendly,
  'isEol': instance.isEol,
};
