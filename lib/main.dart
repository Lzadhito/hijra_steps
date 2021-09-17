import 'package:flutter/material.dart';
import 'package:hijra_steps/screens/Home/home_screen.dart';
import 'package:hijra_steps/screens/Topic/topic_screen.dart';

void main() {
  runApp(HijraSteps());
}

class HijraSteps extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hijra Steps',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (_) => const HomeScreen(),
        '/topic': (_) => const TopicScreen()
      },
    );
  }
}
