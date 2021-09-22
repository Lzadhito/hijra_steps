import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hijra_steps/screens/Home/widgets/constants/padding.dart';
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
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                'assets/home_bg.svg',
                semanticsLabel: 'Home background',
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeHeader(),
              RecommendationWidget(),
              Divider(
                indent: paddingHorizontal,
                endIndent: paddingHorizontal,
                thickness: 2,
              ),
              CurriculumWidget()
            ],
          )
        ],
      ),
    )));
  }
}
