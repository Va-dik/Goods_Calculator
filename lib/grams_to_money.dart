import 'package:flutter/material.dart';
import 'package:goods_calculator/localization/locale_ru.dart';

class GramsToMoney extends StatefulWidget {
  const GramsToMoney({Key? key}) : super(key: key);

  @override
  _GramsToMoneyState createState() => _GramsToMoneyState();
}

class _GramsToMoneyState extends State<GramsToMoney> {
  TextEditingController _controller = TextEditingController();
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
          money == 0 ? Text(mapa.keys.first) : Text(mapa.values.first),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 50,
              width: 50,
              child: TextField(
                controller: _controller,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              height: 50,
              width: 50,
              child: TextField(
                controller: _controller,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              height: 50,
              width: 50,
              child: TextField(
                controller: _controller,
              ),
            ),
          ),
        ]));
  }
}
