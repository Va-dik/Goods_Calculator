import 'package:flutter/material.dart';
import 'package:goods_calculator/grams_to_money.dart';

Widget textField(TextEditingController _controller, bool _readOnly) {
  return TextField(
    maxLength: GramsToMoney.moneyLockChecker == true && GramsToMoney.priceLockChecker == false && GramsToMoney.gramsLockChecker == false? 7 : 5,
    maxLines: 2,
    keyboardType: TextInputType.number,
    textAlign: TextAlign.center,
    decoration: const InputDecoration(
      counterText: '',
        contentPadding: EdgeInsets.symmetric(vertical: 30),
        fillColor: Colors.white,
        filled: false,
        border: InputBorder.none),
    style: TextStyle(fontSize: 39),
    readOnly: _readOnly,
    controller: _controller,
    onTap: () {
      if (_controller.text.isNotEmpty &&
          GramsToMoney.priceLockChecker == true &&
          GramsToMoney.gramsLockChecker == false) {
        GramsToMoney.gramsController.clear();
        GramsToMoney.moneyController.clear();
      } else if (_controller.text.isNotEmpty &&
          GramsToMoney.gramsLockChecker == true &&
          GramsToMoney.priceLockChecker == false) {
        GramsToMoney.priceController.clear();
        GramsToMoney.moneyController.clear();
      } else if (_controller.text.isNotEmpty &&
          GramsToMoney.moneyLockChecker == true) {
        GramsToMoney.priceController.clear();
        GramsToMoney.gramsController.clear();
      } else if (_controller.text.isNotEmpty &&
          GramsToMoney.priceLockChecker == false &&
          GramsToMoney.gramsLockChecker == false &&
          GramsToMoney.moneyLockChecker == false) {
        GramsToMoney.priceController.clear();
        GramsToMoney.gramsController.clear();
        GramsToMoney.moneyController.clear();
      }
    },
  );
}
