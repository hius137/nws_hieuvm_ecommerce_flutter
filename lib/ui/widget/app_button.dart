import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';

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
  const IconBorderButton({
    super.key,
    required this.textButton,
    required this.iconButton,
    required this.colorBorderButton,
    required this.colorText,
    required this.colorButton,
    required this.width,
  });

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

Container itemSize(int index, int curIndex, BuildContext context,List<String> sizes){
  return Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == curIndex ? Colors.black : Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 1,
        )),
    child: Center(
      child: Text(
        sizes[index],
        style: GoogleFonts.poppins(
          color: index == curIndex ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    ),
  );
}
Container itemColor(int index, int curIndex, BuildContext context,List<int> colors){
  return Container(
    width: 20,
    height: 20,
    decoration: BoxDecoration(
      border: Border.all(color: colors[index] == 0xffffffff ? Colors.black : Colors.transparent, width: 1),
      color: Color(colors[index]),
      borderRadius: const BorderRadius.all(Radius.circular(15)),
    ),
    child: index == curIndex ? SvgPicture.asset(colors[index] == 0xff000000 ? AppImages.icCheckWhite : AppImages.icCheckBlack) : const SizedBox(),
    // child: index == curIndex ? SvgPicture.asset( colors[index] == 0xffffffff ? AppImages.icCheckBlack : AppImages.icApple) : const SizedBox(),
  );
}
