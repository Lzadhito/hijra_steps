import 'package:flutter/material.dart';
import 'package:hijra_steps/screens/Home/models/Topic.dart';
import 'package:hijra_steps/screens/Home/widgets/constants/cardRoundedCorner.dart'
    show cardRoundedCorner;

class TopicCard extends StatelessWidget {
  TopicCard({required this.topic});
  final Topic topic;

  @override
  Widget build(BuildContext context) {
    void goToTopicScreen() {
      Navigator.pushNamed(
        context,
        '/topic',
        arguments: topic.id,
      );
    }

    return AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(
                image: NetworkImage(topic.imageUrl),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(left: 9.0, right: 8.0, bottom: 8.0),
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 100,
                child: Card(
                    shape: cardRoundedCorner,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(topic.title),
                              // Text(topic.ustadzName)
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: goToTopicScreen,
                            child: Icon(
                              Icons.navigate_next_rounded,
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                            ))
                      ]),
                    )),
              ),
            ),
          ],
        ));
  }
}
