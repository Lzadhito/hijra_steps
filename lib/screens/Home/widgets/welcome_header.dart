import 'package:flutter/material.dart';
import 'package:hijra_steps/screens/Home/widgets/Loader/welcome_header_loader.dart';
import 'dart:async';
import 'package:dio/dio.dart';

import 'package:hijra_steps/screens/Home/entity/Profile.dart';
import 'package:hijra_steps/screens/Home/widgets/constants/padding.dart';

class WelcomeHeader extends StatefulWidget {
  @override
  _WelcomeHeaderState createState() => _WelcomeHeaderState();
}

class _WelcomeHeaderState extends State<WelcomeHeader> {
  late Future<Profile> futureProfileData;

  Future<Profile> fetchProfile() async {
    const String url = "http://192.168.1.13:3000/profile";
    final response = await Dio().get(url);

    if (response.statusCode == 200) {
      return Profile.fromJson(response.data);
    } else {
      throw Exception('Failed to load profile');
    }
  }

  @override
  initState() {
    super.initState();
    futureProfileData = fetchProfile();
  }

  String generateInitial(List<String> names) {
    final int totalWords = names.length;
    if (totalWords < 2) {
      return names[0][0];
    } else {
      return (names[0][0] + names[totalWords - 1][0]).toUpperCase();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: double.infinity,
            height: 100,
            child: Container(
              color: Colors.greenAccent,
            )),
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
            child: FutureBuilder(
              future: futureProfileData,
              builder: (context, AsyncSnapshot<Profile> snapshot) {
                if (snapshot.hasData) {
                  final String profileName = snapshot.data!.name;
                  final String avatarURL = snapshot.data!.avatarURL;
                  print(avatarURL);
                  final List<String> splitProfileName = profileName.split(" ");
                  final String welcomeName = splitProfileName[0];
                  final String initial = generateInitial(splitProfileName);
                  return Row(children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Assalamualaikum"),
                          Text(welcomeName)
                        ],
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage:
                          avatarURL != '' ? NetworkImage(avatarURL) : null,
                      child: avatarURL == '' ? Text(initial) : null,
                      backgroundColor: Colors.white,
                    ),
                  ]);
                } else {
                  return WelcomeHeaderLoader();
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
