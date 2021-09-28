import 'package:flutter/material.dart';
import 'package:hijra_steps/screens/Home/widgets/Loader/subject_card_loader.dart';

import 'package:hijra_steps/screens/Home/widgets/constants.dart'
    show paddingHorizontal;
import 'package:shimmer/shimmer.dart';

class LevelListLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.only(left: paddingHorizontal, bottom: 8),
            child: Shimmer.fromColors(
              child: Container(
                width: 300.0,
                height: 30.0,
                color: Colors.white,
              ),
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade200,
            )),
        SizedBox(
          height: 200,
          child: ListView.separated(
              separatorBuilder: (BuildContext context, int i) =>
                  SizedBox(width: 15),
              itemCount: 3,
              padding: EdgeInsets.only(left: paddingHorizontal),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return SubjectCardLoader();
              }),
        )
      ],
    );
  }
}
