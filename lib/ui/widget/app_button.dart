import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_colors.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_images.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_text_styles.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.textButton,
      required this.colorButton,
      required this.colorText});

  final String textButton;
  final Color colorButton;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: colorButton,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          textButton,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: colorText,
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
          style: AppTextStyle.white18Bold
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
  final Color colorBorderButton;
  final Color colorButton;
  final Color colorText;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: colorBorderButton,
          width: 1,
        ),
        color: colorButton,
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
                color: colorText),
          ),
        ],
      ),
    );
  }
}

Container itemSize(
    int index, int curIndex, BuildContext context, List<String> sizes) {
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

Container itemColor(
    int index, int curIndex, BuildContext context, List<Color> colors) {
  return Container(
    width: 20,
    height: 20,
    decoration: BoxDecoration(
      border: Border.all(
          color:
              colors[index] == AppColors.white ? AppColors.black : Colors.transparent,
          width: 1),
      color: colors[index],
      borderRadius: const BorderRadius.all(Radius.circular(15)),
    ),
    child: index == curIndex
        ? Image.asset(
            colors[index] == AppColors.black
                ? AppImages.icCheckWhite
                : AppImages.icCheckBlack,
            width: 16,
            height: 16,
          )
        : const SizedBox(),
  );
}

InkWell backButton (BuildContext context){
  return InkWell(
    onTap: () => Navigator.of(context).pop(),
    child: SvgPicture.asset(
      AppImages.icBack,
      width: 50,
      height: 50,
    ),
  );
}
