import 'package:flutter/material.dart';
import 'package:hijra_steps/screens/Home/widgets/constants.dart';
import 'package:hijra_steps/screens/Home/widgets/Curriculum/curriculum.dart';
import 'package:hijra_steps/screens/Home/widgets/Recommendation/recommendation.dart';
import 'package:hijra_steps/screens/Home/widgets/welcome_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var body;
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0XFFD9FFDA),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
          width: double.infinity,
          height: 120,
          child: WelcomeHeader(),
        ),
        (DraggableScrollableSheet(
            initialChildSize: 0.85,
            minChildSize: 0.85,
            builder: (_, _sc) {
              if (body == null) {
                body = SingleChildScrollView(
                  controller: _sc,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24))),
                    margin: const EdgeInsets.all(0),
                    child: Column(children: [
                      SizedBox(height: 30),
                      RecommendationWidget(),
                      Divider(
                        indent: paddingHorizontal,
                        endIndent: paddingHorizontal,
                        thickness: 1,
                      ),
                      CurriculumWidget(),
                    ]),
                  ),
                );
              }
              return body;
            }))
      ],
    )));
  }
}
