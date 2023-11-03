import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextBold extends StatelessWidget {
  final String text;
  final double textSize;
  final int color;

  const TextBold({
    super.key,
    required this.text,
    required this.textSize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
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
  final int color;

  const TextNormal({
    super.key,
    required this.text,
    required this.textSize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.poppins(
        fontSize: textSize,
        fontWeight: FontWeight.normal,
        color: Color(color),
      ),
    );
  }
}


