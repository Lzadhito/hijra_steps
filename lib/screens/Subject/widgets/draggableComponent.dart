import 'package:flutter/material.dart';
import 'package:hijra_steps/screens/Subject/widgets/content.dart';
import 'package:hijra_steps/screens/Subject/widgets/header.dart';
import 'package:sticky_headers/sticky_headers.dart';

class DraggableComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var body;
    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      minChildSize: 0.65,
      builder: (BuildContext context, ScrollController scrollController) {
        if (body == null) {
          body = ListView(controller: scrollController, children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Padding(
                  padding: EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StickyHeader(
                        header: Header(),
                        content: Content(),
                      )
                    ],
                  )),
            )
          ]);
        }
        return body;
      },
    );
  }
}
