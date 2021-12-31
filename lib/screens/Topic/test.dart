import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hijra_steps/screens/Topic/models/topic.dart';
import 'package:hijra_steps/screens/Topic/services/get_topic.dart';

// @TODO: remove this class
class Test123 extends StatelessWidget {
  const Test123({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<Topic>(
      future: client.getTopic(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final Topic posts = snapshot.data!;
          debugPrint(posts.toString());
          return Text(posts.toString());
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
