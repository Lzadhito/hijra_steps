import 'package:flutter/material.dart';
import 'package:hijra_steps/screens/Home/services/recommendation_service.dart';
import 'package:hijra_steps/screens/Home/widgets/Recommendation/recommendation_card.dart';
import 'package:hijra_steps/screens/Home/widgets/Loader/recommendation_loader.dart';

import 'package:hijra_steps/screens/Home/models/Topic.dart';
import 'package:hijra_steps/screens/Home/widgets/constants.dart'
    show paddingHorizontal;

class RecommendationWidget extends StatelessWidget {
  Widget buildRecommendationCard(AsyncSnapshot<Topic> snapshot) {
    final int id = snapshot.data!.id;
    final String imageUrl = snapshot.data!.imageUrl;
    final String description = snapshot.data!.description;
    final String title = snapshot.data!.title;
    final String ustadzName = snapshot.data!.ustadzName;
    return RecommendationCard(
        id: id,
        imageUrl: imageUrl,
        description: description,
        title: title,
        ustadzName: ustadzName);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: paddingHorizontal, right: paddingHorizontal, bottom: 30),
      child: FutureBuilder<Topic>(
          future: RecommendationService().fetchRecommendation(),
          builder: (BuildContext context, AsyncSnapshot<Topic> snapshot) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    "Materi Untukmu",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                snapshot.hasData
                    ? buildRecommendationCard(snapshot)
                    : RecommendationLoader()
              ],
            );
          }),
    );
  }
}
