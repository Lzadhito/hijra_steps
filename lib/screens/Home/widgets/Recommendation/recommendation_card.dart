import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/cardRoundedCorner.dart' show roundedCornerBorderRadius;

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({
    Key? key,
    required this.id,
    required this.imageUrl,
    required this.description,
    required this.title,
    required this.ustadzName,
  }) : super(key: key);

  final int id;
  final String imageUrl;
  final String description;
  final String title;
  final String ustadzName;

  @override
  Widget build(BuildContext context) {
    void goToTopicScreen() {
      Navigator.pushNamed(
        context,
        '/topic',
        arguments: id,
      );
    }

    return SizedBox(
        height: 300,
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
            Container(
              decoration: BoxDecoration(
                borderRadius: roundedCornerBorderRadius,
                color: Color.fromRGBO(0, 0, 0, 0.5),
              ),
              width: double.infinity,
              height: double.infinity,
            ),
            Column(
              children: [
                Expanded(
                    child: Center(
                        child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(description,
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ))),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    height: 100,
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [Text(title), Text(ustadzName)],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: goToTopicScreen,
                                child: Row(
                                  children: [
                                    const Text("Lanjut"),
                                    Icon(
                                      Icons.navigate_next_rounded,
                                    )
                                  ],
                                ),
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                )))),
                          )
                        ])),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
