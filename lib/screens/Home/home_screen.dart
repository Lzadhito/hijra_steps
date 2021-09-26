import 'package:flutter/material.dart';
import 'package:hijra_steps/screens/Home/widgets/constants.dart'
    show paddingHorizontal;
import 'package:hijra_steps/screens/Home/widgets/Curriculum/curriculum.dart';
import 'package:hijra_steps/screens/Home/widgets/Recommendation/recommendation.dart';
import 'package:hijra_steps/screens/Home/widgets/welcome_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: Color(0XFFD9FFDA),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeHeader(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Column(
                    children: [
                      RecommendationWidget(),
                      Divider(
                        height: 50,
                        indent: paddingHorizontal,
                        endIndent: paddingHorizontal,
                        thickness: 1,
                      ),
                      CurriculumWidget(),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    )));
  }
}
