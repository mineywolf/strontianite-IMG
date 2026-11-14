import 'package:json_annotation/json_annotation.dart';
import 'package:strontianite/models/flathub_icon_model.dart';
import 'package:strontianite/models/flathub_release_model.dart';
import 'package:strontianite/models/flathub_screenshots_model.dart';

part 'flathub_app_listing_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FlathubAppListingModel {
  FlathubAppListingModel({
    required this.type,
    required this.id,
    required this.name,
    required this.summary,
    required this.description,
    required this.developerName,
    required this.icon,
    required this.icons,
    required this.screenshots,
    required this.releases,
    required this.urls,
    required this.categories,
    required this.keywords,
    required this.projectLicense,
    required this.isFreeLicense,
    required this.isMobileFriendly,
    required this.isEol,
  });

  final String type;
  final String id;
  final String name;
  final String? summary;
  final String? description;
  final String? developerName;
  final String? icon;
  final List<FlathubIconModel>? icons;
  final FlathubScreenshotsModel? screenshots;
  final List<FlathubReleaseModel>? releases;
  final List<Map<String, String>>? urls;
  final List<String>? categories;
  final List<String>? keywords;
  final String? projectLicense;
  final bool? isFreeLicense;
  final bool? isMobileFriendly;
  final bool? isEol;

  factory FlathubAppListingModel.fromJson(Map<String, dynamic> json) =>
      _$FlathubAppListingModelFromJson(json);

  Map<String, dynamic> toJson() => _$FlathubAppListingModelToJson(this);
}
