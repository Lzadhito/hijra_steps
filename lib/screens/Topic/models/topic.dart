import 'package:json_annotation/json_annotation.dart';
part 'topic.g.dart';

@JsonSerializable()
class Topic {
  final double id;
  final String title;

  @JsonKey(name: 'content_type')
  final String contentType;

  @JsonKey(name: 'topic_author')
  final String topicAuthor;

  @JsonKey(name: 'is_bonus_content')
  final bool isBonusContent;

  @JsonKey(name: 'material_explanation')
  final String description;

  @JsonKey(name: 'content_url')
  final String contentUrl;

  Topic(
      {required this.id,
      required this.title,
      required this.contentType,
      required this.topicAuthor,
      required this.isBonusContent,
      required this.description,
      required this.contentUrl});

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);

  Map<String, dynamic> toJson() => _$TopicToJson(this);
}
