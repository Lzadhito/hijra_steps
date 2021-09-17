import 'package:flutter/material.dart';
import 'package:hijra_steps/screens/Home/services/profile_service.dart';
import 'package:hijra_steps/screens/Home/widgets/Loader/welcome_header_loader.dart';
import 'package:hijra_steps/screens/Home/models/Profile.dart';
import 'package:hijra_steps/screens/Home/widgets/constants/padding.dart';

class WelcomeHeader extends StatelessWidget {
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
              future: ProfileService().fetchProfile(),
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
