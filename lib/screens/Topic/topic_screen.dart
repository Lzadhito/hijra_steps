import 'package:flutter/material.dart';
import 'package:hijra_steps/screens/Topic/widgets/cz_button.dart';
import 'package:hijra_steps/screens/Topic/widgets/cz_scaffold.dart';
import 'package:hijra_steps/screens/Topic/widgets/youtube_player.dart';

import 'package:hijra_steps/screens/Topic/dummy.dart'
    show DUMMY_TITLE, DUMMY_DESC, DUMMY_AUTHOR;
import 'package:hijra_steps/theme/colors.dart' show primaryGreen;

class TopicScreen extends StatelessWidget {
  const TopicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CZScaffold(
      showBackButton: true,
      body: Column(
        children: [
          YoutubePlayer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                // Title & Author
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(DUMMY_TITLE,
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(color: primaryGreen)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          DUMMY_AUTHOR.toUpperCase(),
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      )
                    ],
                  ),
                ),
                // Description
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: const Color(0XFF403F3F), width: 0.5)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 16),
                      child: const Text(DUMMY_DESC),
                    )),
                // Submit Button
                Container(
                    margin: const EdgeInsets.only(bottom: 24.0),
                    width: double.infinity,
                    child: CZButton(
                      onPress: () => {},
                      icon: Icons.check_circle_rounded,
                      text: "Selesai",
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
