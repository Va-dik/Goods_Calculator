import 'package:flutter/material.dart';
import 'package:goods_calculator/localization/locale.dart';
import 'package:goods_calculator/tab_button.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TabButton(text: mapa.keys.elementAt(3)),
                  TabButton(text: mapa.keys.elementAt(4))
                ],
              ),
            )
          ],
        ));
  }
}
