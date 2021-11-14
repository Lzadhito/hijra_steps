import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'images/kaaba1.png',
          width: 600,
          height: 240,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 23,
          ),
          child: MaterialButton(
            onPressed: () {},
            color: Color(0xFFFFFFFF),
            textColor: Color(0xFF666666),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 24,
                )),
            shape: CircleBorder(),
          ),
        )
      ]
    );
  }
}
