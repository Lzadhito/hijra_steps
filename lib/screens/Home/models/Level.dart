import 'package:hijra_steps/screens/Home/models/Topic.dart';

class Level {
  final int id;
  final int order;
  final String title;
  final List<Topic> topics;

  Level(
      {required this.id,
      required this.order,
      this.title = '',
      this.topics = const []});

  factory Level.fromJson(Map<String, dynamic> json) {
    var list = json['topics'] as List;
    List<Topic> topicList = list.map((i) => Topic.fromJson(i)).toList();

    return Level(
        id: json['id'],
        order: json['order'],
        title: json['level_title'],
        topics: topicList);
  }
}
