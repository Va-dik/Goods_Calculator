import 'package:flutter/material.dart';
import 'package:goods_calculator/localization/locale.dart';

class GramsToMoney extends StatefulWidget {
  const GramsToMoney({Key? key}) : super(key: key);

  @override
  _GramsToMoneyState createState() => _GramsToMoneyState();
}

class _GramsToMoneyState extends State<GramsToMoney> {
  final TextEditingController _priceController =
      TextEditingController(text: '0');
  final TextEditingController _gramsController =
      TextEditingController(text: '0');
  final TextEditingController _moneyController =
      TextEditingController(text: '0');

  bool readOnly = false;
  static bool priceLockChecker = false,
      gramsLockChecker = false,
      moneyLockChecker = false;

  @override
  Widget build(BuildContext context) {
    Icon priceLockIcon = priceLockChecker
        ? Icon(Icons.lock_outline, color: Colors.orange[900])
        : Icon(Icons.lock_open, color: Colors.grey[400]);
    Icon gramsLockIcon = gramsLockChecker
        ? Icon(Icons.lock_outline, color: Colors.orange[900])
        : const Icon(Icons.lock_open, color: Colors.grey);
    Icon moneyLockIcon = moneyLockChecker
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
                  priceLockChecker = !priceLockChecker;
                });
              },
              icon: priceLockIcon,
              iconSize: 20,
            ),
            //TextField goods price
            SizedBox(
                height: 100,
                width: 125,
                child: textField(_priceController, readOnly)),
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
                gramsLockChecker = !gramsLockChecker;
              });
            },
            icon: gramsLockIcon,
            iconSize: 20,
          ),
          //TextField goods grams
          SizedBox(
              height: 100,
              width: 125,
              child: textField(_gramsController, readOnly)),
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
                  moneyLockChecker = !moneyLockChecker;
                });
              },
              icon: moneyLockIcon,
              iconSize: 20,
            ),
            //TextField money
            SizedBox(
                height: 100,
                width: 125,
                child: textField(_moneyController, readOnly)),
            Text(
              mapa.keys.elementAt(2),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ]),
    );
  }

  void _result() {
    setState(() {
      if (_gramsController.text.isNotEmpty &&
          _priceController.text.isNotEmpty) {
        _moneyController.text = (double.parse(_priceController.value.text) *
                double.parse(_gramsController.value.text) /
                1000)
            .toStringAsFixed(2);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _gramsController.addListener(_result);
    _priceController.addListener(_result);
  }

  @override
  void dispose() {
    _gramsController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Widget textField(TextEditingController _controller, bool _readOnly) {
    return TextField(
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 30),
          fillColor: Colors.white,
          filled: false,
          border: InputBorder.none),
      style: TextStyle(fontSize: 50),
      readOnly: _readOnly,
      controller: _controller,
      onTap: () {
        if (_controller.text.isNotEmpty &&
            _GramsToMoneyState.priceLockChecker == true &&
            _GramsToMoneyState.gramsLockChecker == false) {
          _gramsController.clear();
          _moneyController.clear();
        } else if (_controller.text.isNotEmpty &&
            _GramsToMoneyState.gramsLockChecker == true &&
            _GramsToMoneyState.priceLockChecker == false) {
          _priceController.clear();
          _moneyController.clear();
        } else if (_controller.text.isNotEmpty &&
            _GramsToMoneyState.moneyLockChecker == true) {
          _priceController.clear();
          _gramsController.clear();
        } else if (_controller.text.isNotEmpty &&
            _GramsToMoneyState.priceLockChecker == false &&
            _GramsToMoneyState.gramsLockChecker == false &&
            _GramsToMoneyState.moneyLockChecker == false) {
          _priceController.clear();
          _gramsController.clear();
          _moneyController.clear();
        }
      },
    );
  }
}
