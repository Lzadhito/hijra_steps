import 'package:hijra_steps/screens/Home/models/Subject.dart';

class Level {
  final int id;
  final int order;
  final String title;
  final List<Subject> subjects;

  Level(
      {required this.id,
      required this.order,
      this.title = '',
      this.subjects = const []});

  factory Level.fromJson(Map<String, dynamic> json) {
    var list = json['subjects'] as List;
    List<Subject> subjectList = list.map((i) => Subject.fromJson(i)).toList();

    return Level(
        id: json['id'],
        order: json['order'],
        title: json['level_title'],
        subjects: subjectList);
  }
}
