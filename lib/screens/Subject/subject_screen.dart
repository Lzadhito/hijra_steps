import 'package:flutter/material.dart';
import 'package:hijra_steps/screens/Subject/widgets/background.dart';
import 'package:hijra_steps/screens/Subject/widgets/draggableComponent.dart';

class SubjectScreen extends StatelessWidget {
  const SubjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter layout',
        home: Scaffold(
          body: SafeArea(
              child: Stack(
            children: <Widget>[
              Background(),
              DraggableComponent(),
            ],
          )),
        ));
  }
}
