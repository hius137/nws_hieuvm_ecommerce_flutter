import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_images.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController searchCategoriesController;
  final Function(String value) onChange;

  const SearchTextField({
    Key? key,
    required this.searchCategoriesController,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchCategoriesController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 10),
            SvgPicture.asset(
              AppImages.icSearch,
            ),
            const SizedBox(width: 10),
          ],
        ),
        filled: true,
        fillColor: Colors.black12,
        hintText: 'Search Categories',
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 10,
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 20,
          minHeight: 20,
        ),
      ),
      onChanged: (value) {
        onChange(value);
      },
    );
  }
}


