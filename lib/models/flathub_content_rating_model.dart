import 'package:json_annotation/json_annotation.dart';

part 'flathub_content_rating_model.g.dart';

@JsonSerializable()
class FlathubContentRatingModel {
  FlathubContentRatingModel({
    required this.contentRatingSystem,
    required this.minimumAge,
    required this.minimumAgeText,
  });

  final String contentRatingSystem;
  final int minimumAge;
  final String minimumAgeText;

  factory FlathubContentRatingModel.fromJson(Map<String, dynamic> json) =>
      _$FlathubContentRatingModelFromJson(json);

  Map<String, dynamic> toJson() => _$FlathubContentRatingModelToJson(this);
}
