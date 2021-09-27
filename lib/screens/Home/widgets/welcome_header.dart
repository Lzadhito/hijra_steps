import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hijra_steps/screens/Home/services/profile_service.dart';
import 'package:hijra_steps/screens/Home/widgets/Loader/welcome_header_loader.dart';
import 'package:hijra_steps/screens/Home/models/Profile.dart';
import 'package:hijra_steps/screens/Home/widgets/constants.dart'
    show paddingHorizontal;
import 'package:hijra_steps/theme/colors.dart';

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
    return FutureBuilder(
      future: ProfileService().fetchProfile(),
      builder: (context, AsyncSnapshot<Profile> snapshot) {
        if (snapshot.hasData) {
          final String profileName = snapshot.data!.name;
          final String avatarURL = snapshot.data!.avatarURL;
          print(avatarURL);
          final List<String> splitProfileName = profileName.split(" ");
          final String welcomeName = splitProfileName[0];
          final String initial = generateInitial(splitProfileName);
          return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Assalamualaikum",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(welcomeName,
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: primaryGreen))
                ],
              ),
            ),
            CircleAvatar(
              radius: 25,
              backgroundImage: avatarURL != ''
                  ? CachedNetworkImageProvider(avatarURL)
                  : null,
              child: avatarURL == '' ? Text(initial) : null,
              backgroundColor: Colors.white,
            ),
          ]);
        } else {
          return WelcomeHeaderLoader();
        }
      },
    );
  }
}
