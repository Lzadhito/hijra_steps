import 'package:flutter/material.dart';
import 'package:hijra_steps/screens/Home/widgets/Recommendation/recommendation_card.dart';
import 'package:hijra_steps/screens/Home/widgets/Loader/recommendation_loader.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:hijra_steps/screens/Home/entity/Topic.dart';
import 'package:hijra_steps/screens/Home/widgets/constants/padding.dart';

class RecommendationWidget extends StatefulWidget {
  @override
  _RecommendationWidgetState createState() => _RecommendationWidgetState();
}

class _RecommendationWidgetState extends State<RecommendationWidget> {
  late Future<Topic> futureRecommendationData;

  Future<Topic> fetchRecommendation() async {
    const String url = "http://192.168.0.199:3000/recommendation/1";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Topic.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load recommendation');
    }
  }

  @override
  void initState() {
    super.initState();
    futureRecommendationData = fetchRecommendation();
  }

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
      padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: FutureBuilder<Topic>(
          future: futureRecommendationData,
          builder: (BuildContext context, AsyncSnapshot<Topic> snapshot) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Materi Untukmu"),
                snapshot.hasData
                    ? buildRecommendationCard(snapshot)
                    : RecommendationLoader()
              ],
            );
          }),
    );
  }
}
