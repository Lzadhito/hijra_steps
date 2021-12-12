import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Accordion extends StatefulWidget {
  final String title;
  final String content;

  Accordion(this.title, this.content);
  @override
  _AccordionState createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  bool _showContent = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 250,
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF087F23),
                  ),
                ),
              ),
              IconButton(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    setState(() {
                      _showContent = !_showContent;
                    });
                  },
                  icon: Icon(_showContent
                      ? Icons.keyboard_arrow_up_sharp
                      : Icons.keyboard_arrow_down_sharp)),
            ],
          ),
          _showContent
              ? Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: TextButton(
                    onPressed: () => {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('2'),
                        Text(widget.content),
                        ElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.play_arrow, color: Colors.white),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            primary: Color(0xFF087F23), // <-- Button color
                            onPrimary: Color(0xFF087F23), // <-- Splash color
                          ),
                        )
                      ],
                    ),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          left: 20,
                        )),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFF696969)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(70.0),
                                    side: BorderSide(color: Colors.grey)))),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
