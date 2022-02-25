import 'package:flutter/material.dart';
import 'package:goods_calculator/grams_to_money.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("Goods Calculator",
              style: TextStyle(
                  fontSize: 23,
                  color: Colors.blue,
                  fontWeight: FontWeight.w900)),
          centerTitle: true,
          leading: Builder(
              builder: (context) => const Icon(
                    Icons.calculate,
                    color: Colors.blue,
                    size: 30,
                  ))),
                  body: GramsToMoney(),
    );
  }
}
