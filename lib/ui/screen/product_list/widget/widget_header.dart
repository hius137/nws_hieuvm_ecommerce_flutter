import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/product_list/product_list_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_button.dart';

class WidgetHeader extends StatefulWidget {
  const WidgetHeader({super.key});

  @override
  State<WidgetHeader> createState() => _WidgetHeaderState();
}

class _WidgetHeaderState extends State<WidgetHeader> {
  late ProductListCubit productListCubit;
  final _searchProductController = TextEditingController();

  @override
  void initState() {
    productListCubit = context.read<ProductListCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListCubit, ProductListState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            backButton(context),
            GestureDetector(
              onTap: () {
                productListCubit.isSearch();
              },
              child: state.isSearch == true
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: TextField(
                        controller: _searchProductController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
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
                          hintText: 'Search...',
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 10,
                          ),
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 20,
                            minHeight: 20,
                          ),
                        ),
                        onChanged: (value) {
                          productListCubit.searchProduct(value);
                        },
                      ),
                    )
                  : SvgPicture.asset(
                      AppImages.icSearch,
                      width: 20,
                      height: 20,
                    ),
            )
          ],
        );
      },
    );
  }
}
