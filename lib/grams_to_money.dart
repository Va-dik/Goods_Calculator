import 'package:flutter/material.dart';
import 'package:goods_calculator/localization/locale.dart';
import 'package:goods_calculator/text_field.dart';

class GramsToMoney extends StatefulWidget {
  const GramsToMoney({Key? key}) : super(key: key);

  static final TextEditingController priceController =
          TextEditingController(text: '0'),
      gramsController = TextEditingController(text: '0'),
      moneyController = TextEditingController(text: '0');

  static bool priceLockChecker = false,
      gramsLockChecker = false,
      moneyLockChecker = false;

  @override
  _GramsToMoneyState createState() => _GramsToMoneyState();
}

class _GramsToMoneyState extends State<GramsToMoney> {
  bool readOnly = false;

  @override
  Widget build(BuildContext context) {
    Icon priceLockIcon = GramsToMoney.priceLockChecker
        ? Icon(Icons.lock_outline, color: Colors.orange[900])
        : Icon(Icons.lock_open, color: Colors.grey[400]);
    Icon gramsLockIcon = GramsToMoney.gramsLockChecker
        ? Icon(Icons.lock_outline, color: Colors.orange[900])
        : const Icon(Icons.lock_open, color: Colors.grey);
    Icon moneyLockIcon = GramsToMoney.moneyLockChecker
        ? Icon(Icons.lock_outline, color: Colors.orange[900])
        : const Icon(Icons.lock_open, color: Colors.grey);

    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        //Price column
        Column(
          children: [
            //Lock price
            IconButton(
              alignment: Alignment(-0.5, 1),
              splashRadius: 0.1,
              onPressed: () {
                setState(() {
                  GramsToMoney.priceLockChecker =
                      !GramsToMoney.priceLockChecker;
                });
              },
              icon: priceLockIcon,
              iconSize: 20,
            ),
            //TextField goods price
            SizedBox(
                height: 180,
                width: 125,
                child: textField(GramsToMoney.priceController, readOnly)),
            Text(mapa.keys.elementAt(0),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),

        Align(
          alignment: Alignment.topCenter,
          child: Container(
              margin: const EdgeInsets.only(left: 3, bottom: 10),
              color: Colors.grey[400],
              height: 200,
              width: 1.5),
        ),
        //Grams column
        Column(children: [
          //Lock grams
          IconButton(
            alignment: Alignment(-0.5, 1),
            splashRadius: 0.1,
            onPressed: () {
              setState(() {
                GramsToMoney.gramsLockChecker = !GramsToMoney.gramsLockChecker;
              });
            },
            icon: gramsLockIcon,
            iconSize: 20,
          ),
          //TextField goods grams
          SizedBox(
              height: 180,
              width: 125,
              child: textField(GramsToMoney.gramsController, readOnly)),
          Text(mapa.keys.elementAt(1),
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ]),

        Align(
          alignment: Alignment.topCenter,
          child: Container(
              margin: const EdgeInsets.only(left: 2, right: 2, bottom: 10),
              color: Colors.grey[400],
              height: 200,
              width: 1.5),
        ),
        //Money column
        Column(
          children: [
            //Lock money
            IconButton(
              alignment: Alignment(-0.5, 1),
              splashRadius: 0.1,
              onPressed: () {
                setState(() {
                  GramsToMoney.moneyLockChecker =
                      !GramsToMoney.moneyLockChecker;
                });
              },
              icon: moneyLockIcon,
              iconSize: 20,
            ),
            //TextField money
            SizedBox(
                height: 180,
                width: 125,
                child: textField(GramsToMoney.moneyController, readOnly)),
            Text(
              mapa.keys.elementAt(2),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ]),
    );
  }

  void result() {
    setState(() {
      if (GramsToMoney.gramsController.text.isNotEmpty &&
          GramsToMoney.priceController.text.isNotEmpty) {
        GramsToMoney.moneyController.text =
            (double.parse(GramsToMoney.priceController.value.text) *
                    double.parse(GramsToMoney.gramsController.value.text) /
                    1000)
                .toStringAsFixed(2);

      if(GramsToMoney.moneyController.value.text.endsWith('.00'))
        {
          GramsToMoney.moneyController.text = double.parse(GramsToMoney.moneyController.value.text).toInt().toString();
        }
        
      }
    });
  }

  @override
  void initState() {
    super.initState();
    GramsToMoney.gramsController.addListener(result);
    GramsToMoney.priceController.addListener(result);
  }

  @override
  void dispose() {
    GramsToMoney.gramsController.dispose();
    GramsToMoney.priceController.dispose();
    super.dispose();
  }
}
