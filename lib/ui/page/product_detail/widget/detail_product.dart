import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_hieuvm_ecommerce_flutter/app_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/product_detail/product_detail_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/product_detail/widget/button.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_button.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_text.dart';

class DetailProduct extends StatefulWidget {
  final String title;
  final String description;
  final int totalPrice;
  final int curlIndexSize;
  final int curlIndexColor;
  final int quantity;

  const DetailProduct({
    super.key,
    required this.title,
    required this.description,
    required this.totalPrice,
    required this.curlIndexSize,
    required this.curlIndexColor,
    required this.quantity,
  });

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  late ProductDetailCubit _productDetailCubit;
  late AppCubit _appCubit;

  @override
  void initState() {
    _productDetailCubit = context.read<ProductDetailCubit>();
    _appCubit = context.read<AppCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];
    List<int> colors = [0xffffffff, 0xff000000, 0xffCADCA8, 0xfff7a01f];
    Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: size.width,
          height: size.height / 2,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextBold(
                      text: widget.title,
                      textSize: 18,
                      color: 0xff000000,
                    ),
                    const SizedBox(height: 5),
                    TextNormal(
                      text: widget.title,
                      textSize: 11,
                      color: 0x73000000,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppImages.icStar,
                          width: 70,
                          height: 10,
                        ),
                        const SizedBox(width: 10),
                        const TextNormal(
                          text: '(320 Review)',
                          textSize: 11,
                          color: 0x73000000,
                        ),
                      ],
                    ),
                    const Spacer(),
                    const TextBold(
                      text: 'Size',
                      textSize: 16,
                      color: 0xff000000,
                    ),
                    const SizedBox(height: 10),
                    _listSize(sizes),
                    const Spacer(),
                    const TextBold(
                      text: 'Description',
                      textSize: 16,
                      color: 0xff000000,
                    ),
                    const SizedBox(height: 10),
                    TextNormal(text: widget.description, textSize: 11, color: 0x73000000,),
                    const Spacer(),
                    const TextNormal(
                      text: 'Total Price',
                      textSize: 9,
                      color: 0x73000000,
                    ),
                    TextBold(
                      text: '\$${widget.totalPrice}.00',
                      textSize: 18,
                      color: 0xff000000,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: SizedBox(
                  height: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffeeeeee),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: _changeTotalProduct(),
                      ),
                      const TextBold(
                        text: 'Available in stock',
                        textSize: 14,
                        color: 0xff000000,
                      ),
                      _listColors(colors),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 10,
                child: InkWell(
                    onTap: () {
                      _productDetailCubit.addToCart(
                        _appCubit.state.userEntity?.id ?? 0,
                      );
                    },
                    child: const AddToCartButton()),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _changeTotalProduct() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            _productDetailCubit.decrement();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 13.0,
              vertical: 13,
            ),
            child: SvgPicture.asset(
              AppImages.icMinus,
              width: 2,
              height: 2,
            ),
          ),
        ),
        TextBold(
          text: '${widget.quantity}',
          textSize: 16,
          color: 0xff000000,
        ),
        InkWell(
          onTap: () {
            _productDetailCubit.increment();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 13),
            child: SvgPicture.asset(
              AppImages.icPlus,
              width: 10,
              height: 10,
            ),
          ),
        ),
      ],
    );
  }

  Widget _listSize(List<String> sizes) {
    return SizedBox(
      width: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          sizes.length,
          (indexSize) => InkWell(
            onTap: () => _productDetailCubit.onChangedSize(indexSize),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: itemSize(indexSize, widget.curlIndexSize, context, sizes),
            ),
          ),
        ),
      ),
    );
  }

  Widget _listColors(List<int> colors) {
    return Container(
      height: 132,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 4),
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          colors.length,
          (index) => InkWell(
            onTap: () => _productDetailCubit.onChangedColors(index),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: itemColor(index, widget.curlIndexColor, context, colors),
            ),
          ),
        ),
      ),
    );
  }
}
