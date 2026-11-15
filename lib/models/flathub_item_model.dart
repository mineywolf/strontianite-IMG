import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class FlathubItemModel {
  FlathubItemModel({
    required this.name,
    required this.keywords,
    required this.summary,
    required this.description,
    required this.id,
    required this.type,
    required this.projectLicense,
    required this.isFreeLicense,
    required this.appId,
    required this.icon,
    required this.mainCatagories,
    required this.subCatagories,
    required this.developerName,
    required this.verificationVerified,
    required this.runtime,
    required this.updatedAt,
    required this.arches,
    required this.addedAt,
    required this.installsLastMonth,
    required this.favouritesCount,
    required this.isMobileFriendly,
  });

  final String? name;
  final List<dynamic>? keywords;
  final String? summary;
  final String? description;
  final String? id;
  final String? type;
  final String? projectLicense;
  final bool? isFreeLicense;
  final String? appId;
  final String? icon;
  final String? mainCatagories;
  final String? subCatagories;
  final String? developerName;
  final bool? verificationVerified;
  final String? runtime;
  final int? updatedAt;
  final List<dynamic> arches;
  final int? addedAt;
  final int? installsLastMonth;
  final int? favouritesCount;
  final bool? isMobileFriendly;

  factory FlathubItemModel.fromJson(Map<String, dynamic> json) {
    return FlathubItemModel(
      name: json['name'],
      keywords: json['keywords'],
      summary: json['summary'],
      description: json['description'],
      id: json['id'],
      type: json['type'],
      projectLicense: json['project_license'],
      isFreeLicense: json['is_free_license'],
      appId: json['app_id'],
      icon: json['icon'],
      mainCatagories: json['main_catagories'],
      subCatagories: json['sub_catagories'],
      developerName: json['developer_name'],
      verificationVerified: json['verification_verified'],
      runtime: json['runtime'],
      updatedAt: json['updated_at'],
      arches: json['arches'],
      addedAt: json['added_at'],
      installsLastMonth: json['installs_last_month'],
      favouritesCount: json['favourites_count'],
      isMobileFriendly: json['isMobileFriendly'],
    );
  }
}
