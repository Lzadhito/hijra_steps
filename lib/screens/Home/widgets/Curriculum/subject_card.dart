import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hijra_steps/screens/Home/models/Subject.dart';
import 'package:hijra_steps/screens/Home/widgets/Curriculum/constants.dart';
import 'package:hijra_steps/theme/colors.dart';

class SubjectCard extends StatelessWidget {
  SubjectCard({required this.subject});
  final Subject subject;

  @override
  Widget build(BuildContext context) {
    void goToSubjectScreen() {
      Navigator.pushNamed(
        context,
        '/subject',
        arguments: subject.id,
      );
    }

    return GestureDetector(
      onTap: goToSubjectScreen,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            width: 190,
            height: subjectCardHeight,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 8),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: CachedNetworkImage(
                          imageUrl: subject.imageUrl,
                          height: 170,
                          color: const Color.fromRGBO(0, 0, 0, 0.1),
                          colorBlendMode: BlendMode.darken,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 18.0, left: 4.0, right: 4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(subject.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(color: primaryGreen)),
                            Text(subject.ustadzName,
                                style: Theme.of(context).textTheme.subtitle1)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 155, left: 140),
                  child: Material(
                    elevation: 2,
                    color: primaryGreen,
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
