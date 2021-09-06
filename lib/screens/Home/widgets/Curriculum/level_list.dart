import 'package:flutter/material.dart';
import 'package:hijra_steps/screens/Home/entity/Level.dart';

import 'package:hijra_steps/screens/Home/widgets/constants/padding.dart';

import 'topic_card.dart';

class LevelList extends StatelessWidget {
  LevelList({
    required this.level,
  });

  final Level level;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: paddingHorizontal),
          child: Text('${level.order} ${level.title}'),
        ),
        SizedBox(
          height: 200,
          child: ListView.separated(
              separatorBuilder: (BuildContext context, int i) =>
                  SizedBox(width: 15),
              itemCount: level.topics.length,
              padding: EdgeInsets.only(left: paddingHorizontal),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return TopicCard(topic: level.topics[index]);
              }),
        )
      ],
    );
  }
}
