import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hijra_steps/theme/colors.dart';

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
    void goToSubjectScreen() {
      Navigator.pushNamed(
        context,
        '/subject',
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
                  color: const Color.fromRGBO(0, 0, 0, 0.5),
                  colorBlendMode: BlendMode.darken,
                  imageUrl: imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Expanded(
                      child: Center(
                          child: Text(
                    description,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.white),
                  ))),
                  Padding(
                    padding: EdgeInsets.only(bottom: 18.0),
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 14.0),
                          child: Row(children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .copyWith(color: primaryGreen)),
                                  Text(ustadzName,
                                      style:
                                          Theme.of(context).textTheme.subtitle1)
                                ],
                              ),
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: primaryGreen,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    )),
                                onPressed: goToSubjectScreen,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Text(
                                    "Pelajari",
                                    style: Theme.of(context)
                                        .textTheme
                                        .button!
                                        .copyWith(color: Colors.white),
                                  ),
                                ))
                          ]),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
