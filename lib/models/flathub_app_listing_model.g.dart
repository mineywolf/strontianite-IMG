// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flathub_app_listing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlathubAppListingModel _$FlathubAppListingModelFromJson(
  Map<String, dynamic> json,
) => FlathubAppListingModel(
  type: json['type'] as String?,
  id: json['id'] as String?,
  name: json['name'] as String?,
  summary: json['summary'] as String?,
  description: json['description'] as String?,
  developerName: json['developer_name'] as String?,
  icon: json['icon'] as String?,
  icons: (json['icons'] as List<dynamic>?)
      ?.map((e) => FlathubIconModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  screenshots: (json['screenshots'] as List<dynamic>?)
      ?.map((e) => FlathubScreenshotsModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  releases: (json['releases'] as List<dynamic>?)
      ?.map((e) => FlathubReleaseModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  urls: (json['urls'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String?),
  ),
  categories: (json['categories'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  keywords: (json['keywords'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  projectLicense: json['project_license'] as String?,
  isFreeLicense: json['is_free_license'] as bool?,
  isMobileFriendly: json['isMobileFriendly'] as bool?,
  isEol: json['is_eol'] as bool?,
  contentRatingDetails:
      (json['content_rating_details'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
          k,
          e == null
              ? null
              : FlathubContentRatingModel.fromJson(e as Map<String, dynamic>),
        ),
      ),
  bundle: json['bundle'] == null
      ? null
      : FlathubBundleModel.fromJson(json['bundle'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FlathubAppListingModelToJson(
  FlathubAppListingModel instance,
) => <String, dynamic>{
  'type': instance.type,
  'id': instance.id,
  'name': instance.name,
  'summary': instance.summary,
  'description': instance.description,
  'developer_name': instance.developerName,
  'icon': instance.icon,
  'icons': instance.icons?.map((e) => e.toJson()).toList(),
  'screenshots': instance.screenshots?.map((e) => e.toJson()).toList(),
  'releases': instance.releases?.map((e) => e.toJson()).toList(),
  'urls': instance.urls,
  'categories': instance.categories,
  'keywords': instance.keywords,
  'project_license': instance.projectLicense,
  'is_free_license': instance.isFreeLicense,
  'isMobileFriendly': instance.isMobileFriendly,
  'is_eol': instance.isEol,
  'content_rating_details': instance.contentRatingDetails?.map(
    (k, e) => MapEntry(k, e?.toJson()),
  ),
  'bundle': instance.bundle?.toJson(),
};
