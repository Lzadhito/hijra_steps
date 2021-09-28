import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:hijra_steps/screens/Home/widgets/constants.dart'
    show cardRoundedCorner;

class SubjectCardLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1,
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade200,
          child: Card(
            shape: cardRoundedCorner,
            child: Container(
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ));
  }
}
