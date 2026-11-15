import 'package:json_annotation/json_annotation.dart';

part 'flathub_release_model.g.dart';

@JsonSerializable()
class FlathubReleaseModel {
  FlathubReleaseModel({
    required this.timestamp,
    required this.version,
    required this.type,
  });

  final String? timestamp;
  final String? version;
  final String? type;

  factory FlathubReleaseModel.fromJson(Map<String, dynamic> json) =>
      _$FlathubReleaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FlathubReleaseModelToJson(this);
}
