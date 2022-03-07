import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  String text;
  TabButton({Key? key, this.text = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 35),
      child: Text(text),
    );
  }
}
