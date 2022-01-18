import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:unify/unify_button.dart';
import 'package:hijra_steps/theme/colors.dart' show primaryGreen;

class TopicDetail extends StatelessWidget {
  final String title;
  final String author;
  final String desc;

  const TopicDetail({
    Key? key,
    required this.title,
    required this.author,
    required this.desc,
  }) : super(key: key);

  void onPressSelesai(BuildContext context) {
    // @TODO: Send BE something about the study is finished
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title & Author
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: primaryGreen)),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    author.toUpperCase(),
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                )
              ],
            ),
          ),
          // Description
          if (desc != '')
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 12, left: 12, right: 12, bottom: 48),
                child: Html(data: desc),
              ),
            ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 24.0),
              width: double.infinity,
              child: UnifyButton(
                onPress: () => onPressSelesai(context),
                icon: Icons.check_circle_rounded,
                text: "Selesai",
              ))
        ],
      ),
    );
  }
}
