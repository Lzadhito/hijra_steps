import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 20,
          bottom: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Apa Itu Agama Islam?',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF087F23),
              ),
            ),
            Icon(Icons.more_horiz),
          ],
        ),
      ),
    );
  }
}
