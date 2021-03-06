import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hijra_steps/screens/Home/home_screen.dart';
import 'package:hijra_steps/screens/Subject/subject_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hijra_steps/screens/Topic/topic_screen.dart';
import 'package:hijra_steps/theme/colors.dart' show subtitle;

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(HijraSteps());
}

class HijraSteps extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hijra Steps',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
                bodyText1: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5),
                bodyText2: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.25),
                headline1: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.15),
                headline2: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.15),
                headline3: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5),
                headline4: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.25),
                subtitle1: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.3,
                    color: subtitle),
                subtitle2: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.3,
                    color: subtitle),
                button: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5))
            .apply(
                bodyColor: Color(0XFF403F3F), displayColor: Color(0XFF403F3F)),
      ),
      // @TODO: change to /home when merging to master
      initialRoute: '/main',
      getPages: [
        GetPage(name: "/home", page: () => const HomeScreen()),
        GetPage(name: "/subject", page: () => const SubjectScreen()),
        GetPage(name: "/topic", page: () => const TopicScreen()),
      ],
    );
  }
}
