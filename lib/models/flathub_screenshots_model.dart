import 'package:json_annotation/json_annotation.dart';
import 'package:strontianite/models/flathub_screenshot_model.dart';

part 'flathub_screenshots_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FlathubScreenshotsModel {
  FlathubScreenshotsModel({
    required this.sizes,
    required this.caption,
    required this.isDefault,
  });

  final List<FlathubScreenshotModel>? sizes;
  final String? caption;
  final bool? isDefault;

  factory FlathubScreenshotsModel.fromJson(Map<String, dynamic> json) =>
      _$FlathubScreenshotsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FlathubScreenshotsModelToJson(this);
}
