import 'package:flutter/material.dart';
import 'package:goods_calculator/localization/locale.dart';
import "dart:math";

class GramsToMoney extends StatefulWidget {
  const GramsToMoney({Key? key}) : super(key: key);

  @override
  _GramsToMoneyState createState() => _GramsToMoneyState();
}

class _GramsToMoneyState extends State<GramsToMoney> {
  TextEditingController money = TextEditingController();
  TextEditingController goodsGrams = TextEditingController();
  TextEditingController goodsPrice = TextEditingController();

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

    return Container(
      color: Colors.amber,
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 450),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        //Price column
        Column(
          children: [
            //Lock price
            IconButton(
                splashRadius: 0.1,
                onPressed: () {
                  setState(() {
                    priceLockChecker = !priceLockChecker;
                  });
                },
                icon: priceLockIcon),
            //TextField goods price
            SizedBox(
                height: 100,
                width: 100,
                child: textField(goodsPrice, readOnly)),
            Text(mapa.keys.elementAt(0),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),

        Container(
            margin: EdgeInsets.only(right: 2),
            color: Colors.black,
            height: 70,
            width: 2),
        //Grams column
        Column(children: [
          //Lock grams
          IconButton(
              splashRadius: 0.1,
              onPressed: () {
                setState(() {
                  gramsLockChecker = !gramsLockChecker;
                });
              },
              icon: gramsLockIcon),
          //TextField goods grams
          SizedBox(
              height: 100, width: 100, child: textField(goodsGrams, readOnly)),
          Text(mapa.keys.elementAt(1),
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ]),

        Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
            color: Colors.black,
            height: 70,
            width: 2),
        //Money column
        Column(
          children: [
            //Lock money
            IconButton(
                splashRadius: 0.1,
                onPressed: () {
                  setState(() {
                    moneyLockChecker = !moneyLockChecker;
                  });
                },
                icon: moneyLockIcon),
            //TextField money
            SizedBox(
                height: 100, width: 100, child: textField(money, readOnly)),
            Text(
              mapa.keys.elementAt(2),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ]),
    );
  }

  void _result() {
    setState(() {
      if (goodsGrams.text.isNotEmpty && goodsPrice.text.isNotEmpty) {
        money.text = (double.parse(goodsPrice.value.text) *
                double.parse(goodsGrams.value.text) /
                1000)
            .toStringAsFixed(2);
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

  Widget textField(TextEditingController controller, bool readOnly) {
    return TextField(
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 30),
        fillColor: Colors.white,
        filled: false,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.white, width: 2),
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
          goodsGrams.clear();
          money.clear();
        } else if (controller.text.isNotEmpty &&
            _GramsToMoneyState.gramsLockChecker == true &&
            _GramsToMoneyState.priceLockChecker == false) {
          goodsPrice.clear();
          money.clear();
        } else if (controller.text.isNotEmpty &&
            _GramsToMoneyState.moneyLockChecker == true) {
          goodsPrice.clear();
          goodsGrams.clear();
        } else if (controller.text.isNotEmpty &&
            _GramsToMoneyState.priceLockChecker == false &&
            _GramsToMoneyState.gramsLockChecker == false &&
            _GramsToMoneyState.moneyLockChecker == false) {
          goodsPrice.clear();
          goodsGrams.clear();
          money.clear();
        }
      },
    );
  }
}
