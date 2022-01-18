import 'package:flutter/material.dart';
import 'package:unify/unify_scaffold.dart';
import 'package:hijra_steps/screens/Topic/widgets/topic_container.dart';

class TopicScreen extends StatelessWidget {
  const TopicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnifyScaffold(showBackButton: true, body: TopicContainer());
  }
}
