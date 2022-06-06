import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabButton extends StatelessWidget {
  final String? text;
  final int? selectedPage;
  final int? pageNumber;
  final void Function()? onPressed;
  const TabButton(
      {Key? key, this.text, this.selectedPage, this.pageNumber, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
          child: Text(
            "$text",
            style: GoogleFonts.robotoSlab(
              textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color:
                      selectedPage == pageNumber ? Colors.black : Colors.grey),
            ),
          )),
    );
  }
}
