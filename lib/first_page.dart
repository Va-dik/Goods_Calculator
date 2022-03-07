import 'package:flutter/material.dart';
import 'package:goods_calculator/grams_to_money.dart';
import 'package:goods_calculator/localization/locale.dart';
import 'package:goods_calculator/tab_button.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _selectedPage = 0;
  PageController _pageController = PageController();

  void _changePage(int pageNum) {
    setState(() {
      _selectedPage = pageNum;
      _pageController.animateToPage(pageNum,
          duration: Duration(microseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn);
    });
  }

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TabButton(
                    text: mapa.keys.elementAt(3),
                    pageNumber: 0,
                    selectedPage: _selectedPage,
                    onPressed: () {
                      _changePage(0);
                    },
                  ),
                  TabButton(
                    text: mapa.keys.elementAt(4),
                    pageNumber: 1,
                    selectedPage: _selectedPage,
                    onPressed: () {
                      _changePage(1);
                    },
                  )
                ],
              ),
            ),
            Expanded(
                child: PageView(
              onPageChanged: (int page) {
                setState(() {
                  _selectedPage = page;
                });
              },
              controller: _pageController,
              children: [
                GramsToMoney(),
                Container(
                  child: Center(child: Text("2 Page")),
                )
              ],
            ))
          ],
        ));
  }
}
