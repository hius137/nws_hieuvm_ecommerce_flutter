import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class TextBold extends StatelessWidget {
  final String text;
  final double textSize;
  final int color;
  const TextBold({super.key, required this.text, required this.textSize, required this.color,});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
        fontSize: textSize,
        fontWeight: FontWeight.bold,
        color: Color(color),
      ),
    );
  }
}
class TextNormal extends StatelessWidget {
  final String text;
  final double textSize;
  const TextNormal({super.key, required this.text, required this.textSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: textSize,
        fontWeight: FontWeight.normal,
        color: Colors.black45,
      ),
    );
  }
}

class TextEEEE extends StatelessWidget {
  final String text;
  final double textSize;
  const TextEEEE({super.key, required this.text, required this.textSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: textSize,
        fontWeight: FontWeight.normal,
        color: Colors.black38,
      ),
    );
  }
}
class TextBoldEEEE extends StatelessWidget {
  final String text;
  final double textSize;
  const TextBoldEEEE({super.key, required this.text, required this.textSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: textSize,
        fontWeight: FontWeight.bold,
        color: Colors.black38,
      ),
    );
  }
}

