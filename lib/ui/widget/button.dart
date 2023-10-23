import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.textButton,
      required this.colorButton,
      required this.colorText});

  final String textButton;
  final int colorButton;
  final int colorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Color(colorButton),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          textButton,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(colorText),
          ),
        ),
      ),
    );
  }
}

class BorderButton extends StatelessWidget {
  const BorderButton({super.key, required this.textButton});
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          textButton,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff),
          ),
        ),
      ),
    );
  }
}

class IconBorderButton extends StatelessWidget {
  const IconBorderButton(
      {super.key,
      required this.textButton,
      required this.iconButton,
      required this.colorBorderButton,
      required this.colorText,
      required this.colorButton, required this.width,});

  final String textButton;
  final String iconButton;
  final int colorBorderButton;
  final int colorButton;
  final int colorText;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(colorBorderButton),
          width: 1,
        ),
        color: Color(colorButton),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(iconButton),
            width: 25,
            height: 25,
          ),
          Text(
            textButton,
            style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(colorText)),
          ),
        ],
      ),
    );
  }
}

class SizeButton extends StatefulWidget {
  final String textButton;

  const SizeButton({
    super.key,
    required this.textButton,
  });

  @override
  _SizeButtonState createState() => _SizeButtonState();
}

class _SizeButtonState extends State<SizeButton> {
  bool _isPressed = false;

  void _handleTap() {
    setState(() {
      _isPressed = !_isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _handleTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _isPressed ? Colors.black : Colors.white,
            border: Border.all(
              color: Colors.black,
              width: 1,
            )),
        child: Center(
          child: Text(
            widget.textButton,
            style: GoogleFonts.poppins(
              color: _isPressed ? Colors.white : Colors.black45,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

class SelectColorButton extends StatelessWidget {
  final int colorButton;
  const SelectColorButton({super.key, required this.colorButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: Color(colorButton),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
    );
  }
}




