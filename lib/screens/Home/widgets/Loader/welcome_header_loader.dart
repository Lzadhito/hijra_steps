import 'package:flutter/material.dart';
import 'package:hijra_steps/screens/Home/widgets/constants/padding.dart';
import 'package:shimmer/shimmer.dart';

class WelcomeHeaderLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
                child: Container(
                  width: 100,
                  height: 20,
                  color: Colors.white,
                ),
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade200),
            SizedBox(
              height: 10,
            ),
            Shimmer.fromColors(
                child: Container(
                  width: 200,
                  height: 20,
                  color: Colors.white,
                ),
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade200)
          ],
        ),
      ),
      Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade200,
        child: ClipOval(
            child: Container(
          height: 40,
          width: 40,
          color: Colors.white,
        )),
      ),
    ]);
  }
}
