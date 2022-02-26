import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:goods_calculator/localization/locale_ru.dart';

class GramsToMoney extends StatefulWidget {
  const GramsToMoney({Key? key}) : super(key: key);

  @override
  _GramsToMoneyState createState() => _GramsToMoneyState();
}

class _GramsToMoneyState extends State<GramsToMoney> {
  List<TextEditingController> _controller = [
    for (int i = 0; i < 3; i++) TextEditingController()
  ];

  double money = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 560),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 5,
          ),
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue[200],
        ),
        child: Stack(children: [
          money == 0
              ? Text(
                  mapa.keys.first,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )
              : Text(mapa.values.first),
          Align(
            alignment: const Alignment(-1, 1),
            child: SizedBox(
              height: 50,
              width: 50,
              child: TextField(
                controller: _controller[0],
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-0.4, -1),
            child: SizedBox(
              height: 50,
              width: 60,
              child: TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10), //Change this value to custom as you like
                  isDense: true,
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                  // and add this line
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.cyan, width: 2),
                  ),
                ),
                controller: _controller[1],
              ),
            ),
          ),
          Align(
            alignment: const Alignment(1, 1),
            child: SizedBox(
              height: 50,
              width: 50,
              child: TextField(
                controller: _controller[2],
              ),
            ),
          ),
        ]));
  }
}
