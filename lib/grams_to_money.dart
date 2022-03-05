import 'package:flutter/material.dart';
import 'package:goods_calculator/localization/locale_ru.dart';

class GramsToMoney extends StatefulWidget {
  const GramsToMoney({Key? key}) : super(key: key);

  @override
  _GramsToMoneyState createState() => _GramsToMoneyState();
}

class _GramsToMoneyState extends State<GramsToMoney> {
  static TextEditingController money = TextEditingController();
  static TextEditingController goodsGrams = TextEditingController();
  static TextEditingController goodsPrice = TextEditingController();

  int iconsIndex = 0;
  bool readOnly = false;
  static bool priceLockChecker = false;
  static bool gramsLockChecker = false;
  static bool moneyLockChecker = false;
  Icon lockIcon = Icon(Icons.lock_open);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        width: 300,
        margin: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 5,
          ),
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue[200],
        ),
        child: Stack(children: [
          money != 0
              ? Align(
                  alignment: const Alignment(-1, -0.95),
                  child: Text(
                    mapa.keys.first,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              : Align(
                  alignment: const Alignment(-1, -0.95),
                  child: Text(mapa.values.first,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ),
          Align(
            alignment: const Alignment(-1, -0.55),
            child: Text(
              mapa.keys.elementAt(2),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
              alignment: const Alignment(-1, -0.75),
              child: Text(mapa.keys.elementAt(1),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold))),
          Align(
            alignment: const Alignment(0.62, -0.945),
            child: SizedBox(
                height: 50,
                width: 50,
                child: Widgets.textField(goodsPrice, readOnly)),
          ),
          Align(
            alignment: const Alignment(0.02, -0.735),
            child: SizedBox(
                height: 50,
                width: 50,
                child: Widgets.textField(goodsGrams, readOnly)),
          ),
          Align(
            alignment: const Alignment(-0.5, -0.525),
            child: SizedBox(
                height: 50,
                width: 50,
                child: Widgets.textField(money, readOnly)),
          ),
          Align(
              alignment: const Alignment(-0.01, -0.58),
              child: IconButton(
                  splashColor: Colors.red,
                  onPressed: () {
                    lockState();
                    setState(() {
                      if (iconsIndex == 0) {
                        moneyLockChecker = false;
                      }
                      if (iconsIndex == 1) {
                        moneyLockChecker = true;
                      }
                      print(moneyLockChecker);
                    });
                  },
                  icon: lockIcon)),
        ]));
  }

  void lockState() {
    setState(() {
      iconsIndex++;
      if (iconsIndex > 1) {
        iconsIndex = 0;
      }
      if (iconsIndex == 0) {
        lockIcon = Icon(Icons.lock_open);
      } else if (iconsIndex == 1) {
        lockIcon = Icon(Icons.lock_outline);
      }
    });
  }

  void _result() {
    setState(() {
      if (goodsGrams.text.isNotEmpty && goodsPrice.text.isNotEmpty) {
        money.text = (double.parse(goodsPrice.value.text) *
                double.parse(goodsGrams.value.text) /
                1000)
            .toString();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    goodsGrams.addListener(_result);
    goodsPrice.addListener(_result);
  }

  @override
  void dispose() {
    goodsGrams.dispose();
    goodsPrice.dispose();
    super.dispose();
  }
}

class Widgets {
  static Widget textField(TextEditingController controller, bool valid) {
    return TextField(
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
      readOnly: valid,
      controller: controller,
      onTap: () {
        if (_GramsToMoneyState.money.text.isNotEmpty &&
            _GramsToMoneyState.goodsPrice.text.isNotEmpty &&
            _GramsToMoneyState.goodsGrams.text.isNotEmpty &&
            _GramsToMoneyState.moneyLockChecker == false) {
          _GramsToMoneyState.goodsPrice.clear();
          _GramsToMoneyState.goodsGrams.clear();
          _GramsToMoneyState.money.clear();
        }
      },
    );
  }
}
