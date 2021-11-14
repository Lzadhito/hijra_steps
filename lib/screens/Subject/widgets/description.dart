import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 10,
          ),
          child: Text(
            'Ustadz Muhammad Fulan L.c.',
            style: TextStyle(color: Color(0xFF696969)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 10,
          ),
          child: Text(
            'Memahami terlebih dahulu tujuan dasar dan pokok Agama Islam. Sehingga kita paham bahwa Agama ini bukan hanya sekedar ritual belaka.',
            style: TextStyle(
              color: Color(0xFF404040),
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
