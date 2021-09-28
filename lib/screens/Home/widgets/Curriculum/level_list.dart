import 'package:flutter/material.dart';

import 'package:hijra_steps/screens/Home/models/Level.dart';
import 'package:hijra_steps/screens/Home/widgets/constants.dart'
    show paddingHorizontal;
import 'package:hijra_steps/screens/Home/widgets/Curriculum/constants.dart';
import 'package:hijra_steps/theme/colors.dart';

import 'subject_card.dart';

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
          padding: const EdgeInsets.only(left: paddingHorizontal, bottom: 10),
          child: Row(
            children: [
              Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: black)),
                  child: Center(child: Text(level.order.toString()))),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  level.title,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: subjectCardHeight,
          child: ListView.separated(
              separatorBuilder: (BuildContext context, int i) =>
                  SizedBox(width: 10),
              itemCount: level.subjects.length,
              padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return SubjectCard(subject: level.subjects[index]);
              }),
        )
      ],
    );
  }
}
