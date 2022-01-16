import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hijra_steps/screens/Topic/models/topic.dart';
import 'package:hijra_steps/screens/Topic/services/get_topic.dart';
import 'package:hijra_steps/screens/Topic/widgets/topic_detail.dart';
import 'package:hijra_steps/screens/Topic/widgets/youtube_player.dart';

class TopicContainer extends StatelessWidget {
  const TopicContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<Topic>(
      future: client.getTopic(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final Topic posts = snapshot.data!;
          debugPrint(posts.toString());
          return ListView(
            shrinkWrap: true,
            children: [
              YoutubePlayer(contentUrl: posts.contentUrl),
              TopicDetail(
                  title: posts.title,
                  author: posts.topicAuthor,
                  desc: posts.description),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
