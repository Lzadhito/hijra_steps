import 'package:flutter/material.dart';
import 'package:hijra_steps/screens/Home/home_screen.dart';
import 'package:hijra_steps/screens/Topic/topic_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
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
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
            bodyText1: TextStyle(
                fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.25),
            bodyText2: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.5),
            headline1: TextStyle(
                fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
            headline2: TextStyle(
                fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.15),
            headline3: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 0.5),
            headline4: TextStyle(
                fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.25),
            subtitle1: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.3),
            subtitle2: TextStyle(
                fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 0.3),
            button: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.25)),
      ),
      initialRoute: '/home',
      routes: {
        '/home': (_) => const HomeScreen(),
        '/topic': (_) => const TopicScreen()
      },
    );
  }
}
