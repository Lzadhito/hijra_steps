import 'package:flutter/material.dart';
import 'package:hijra_steps/screens/Topic/widgets/cz_scaffold.dart';
import 'package:hijra_steps/screens/Topic/widgets/topic_container.dart';

class TopicScreen extends StatelessWidget {
  const TopicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CZScaffold(showBackButton: true, body: TopicContainer());
  }
}
