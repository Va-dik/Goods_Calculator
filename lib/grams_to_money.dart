import 'package:flutter/material.dart';
import 'package:goods_calculator/localization/locale.dart';

class GramsToMoney extends StatefulWidget {
  const GramsToMoney({Key? key}) : super(key: key);

  @override
  _GramsToMoneyState createState() => _GramsToMoneyState();
}

class _GramsToMoneyState extends State<GramsToMoney> {
  static TextEditingController money = TextEditingController();
  static TextEditingController goodsGrams = TextEditingController();
  static TextEditingController goodsPrice = TextEditingController();

  bool readOnly = false;
  static bool priceLockChecker = false,
      gramsLockChecker = false,
      moneyLockChecker = false;

  @override
  Widget build(BuildContext context) {
    Icon priceLockIcon = priceLockChecker
        ? Icon(Icons.lock_outline, color: Colors.orange[900])
        : const Icon(Icons.lock_open);
    Icon gramsLockIcon = gramsLockChecker
        ? Icon(Icons.lock_outline, color: Colors.orange[900])
        : const Icon(Icons.lock_open);
    Icon moneyLockIcon = moneyLockChecker
        ? Icon(Icons.lock_outline, color: Colors.orange[900])
        : const Icon(Icons.lock_open);

    return Stack(children: [
      money.text != "-1" //Localization
          //Text
          ? Align(
              alignment: const Alignment(-1, -0.95),
              child: Text(
                mapa.keys.first,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          //Text
          : Align(
              alignment: const Alignment(-1, -0.95),
              child: Text(mapa.values.first,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
            ),
      //Text
      Align(
          alignment: const Alignment(-1, -0.75),
          child: Text(mapa.keys.elementAt(1),
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
      //Text
      Align(
        alignment: const Alignment(-1, -0.55),
        child: Text(
          mapa.keys.elementAt(2),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      //TextField goods price
      Align(
        alignment: const Alignment(0.62, -0.945),
        child: SizedBox(
            height: 50, width: 50, child: textField(goodsPrice, readOnly)),
      ),
      //TextField goods grams
      Align(
        alignment: const Alignment(0.02, -0.735),
        child: SizedBox(
            height: 50, width: 50, child: textField(goodsGrams, readOnly)),
      ),
      //TextField money
      Align(
        alignment: const Alignment(-0.5, -0.525),
        child:
            SizedBox(height: 50, width: 50, child: textField(money, readOnly)),
      ),
      //Lock price
      Align(
          alignment: const Alignment(0.9, -0.945),
          child: IconButton(
              splashColor: Colors.red,
              onPressed: () {
                setState(() {
                  priceLockChecker = !priceLockChecker;
                  print(priceLockChecker);
                });
              },
              icon: priceLockIcon)),
      //Lock grams
      Align(
          alignment: const Alignment(0.3, -0.735),
          child: IconButton(
              splashColor: Colors.red,
              onPressed: () {
                setState(() {
                  gramsLockChecker = !gramsLockChecker;
                  print(gramsLockChecker);
                });
              },
              icon: gramsLockIcon)),
      //Lock money
      Align(
          alignment: const Alignment(-0.01, -0.58),
          child: IconButton(
              splashColor: Colors.red,
              onPressed: () {
                setState(() {
                  moneyLockChecker = !moneyLockChecker;
                  print(moneyLockChecker);
                });
              },
              icon: moneyLockIcon)),
    ]);
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

Widget textField(TextEditingController controller, bool readOnly) {
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
    readOnly: readOnly,
    controller: controller,
    onTap: () {
      if (controller.text.isNotEmpty &&
          _GramsToMoneyState.priceLockChecker == true &&
          _GramsToMoneyState.gramsLockChecker == false) {
        _GramsToMoneyState.goodsGrams.clear();
        _GramsToMoneyState.money.clear();
      } else if (controller.text.isNotEmpty &&
          _GramsToMoneyState.gramsLockChecker == true &&
          _GramsToMoneyState.priceLockChecker == false) {
        _GramsToMoneyState.goodsPrice.clear();
        _GramsToMoneyState.money.clear();
      } else if (controller.text.isNotEmpty &&
          _GramsToMoneyState.moneyLockChecker == true) {
        _GramsToMoneyState.goodsPrice.clear();
        _GramsToMoneyState.goodsGrams.clear();
      } else if (controller.text.isNotEmpty &&
          _GramsToMoneyState.priceLockChecker == false &&
          _GramsToMoneyState.gramsLockChecker == false &&
          _GramsToMoneyState.moneyLockChecker == false) {
        _GramsToMoneyState.goodsPrice.clear();
        _GramsToMoneyState.goodsGrams.clear();
        _GramsToMoneyState.money.clear();
      }
    },
  );
}
