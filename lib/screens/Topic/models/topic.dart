import 'package:json_annotation/json_annotation.dart';
part 'topic.g.dart';

@JsonSerializable()
class Topic {
  final double id;
  final String title;
  final String content_type;
  final String topic_author;
  final bool is_bonus_content;
  final String material_explanation;

  Topic({
    required this.id,
    required this.title,
    required this.content_type,
    required this.topic_author,
    required this.is_bonus_content,
    required this.material_explanation,
  });

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);

  Map<String, dynamic> toJson() => _$TopicToJson(this);
}
