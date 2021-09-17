import 'package:flutter/material.dart';

class TopicScreen extends StatelessWidget {
  const TopicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final argsID = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Text("Coming Soon!"),
            Text("(Topic Screen $argsID)"),
          ],
        ),
      ),
    )));
  }
}
