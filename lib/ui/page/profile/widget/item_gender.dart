import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomGender extends StatefulWidget {
  final String text;
  const CustomGender({super.key, required this.text});

  @override
  State<CustomGender> createState() => _CustomGenderState();
}

class _CustomGenderState extends State<CustomGender> {
  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => isSwitch = !isSwitch);
        // widget.onToggled(isSwitch);
      },
      onPanEnd: (b) {
        setState(() => isSwitch = !isSwitch);
        // widget.onToggled(isSwitch);
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.all(6),
        duration: const Duration(milliseconds: 300),
        curve:  Curves.decelerate,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black12, width: 1),
            color: isSwitch ? const Color(0xff000000) : const Color(0xffeeeeee)
        ),
        child: Row(
          children: [
            Container(
              height: 12,
              width: 12,
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.only(right: 2),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      width: 1,
                      color: isSwitch ? Colors.white : Colors.white),
                  color: Colors.transparent),
              child: Container(
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSwitch ? Colors.white : Colors.transparent,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Text(widget.text, style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isSwitch ? Colors.white : Colors.black38
            ),),
          ],
        ),
      ),
    );
  }
}
