import 'package:flutter/material.dart';
import 'package:goods_calculator/grams_to_money.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "Goods Calculator",
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
          title: Text("Goods Calculator",
              style: GoogleFonts.roboto(textStyle: TextStyle(
                  fontSize: 23,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold))),
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
