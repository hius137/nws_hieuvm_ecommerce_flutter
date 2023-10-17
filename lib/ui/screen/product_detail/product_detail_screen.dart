import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/product_detail/product_detail_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/button.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/item/dot.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/text.dart';

class ProductDetailScreen extends StatelessWidget {
  final int idProduct;
  final int price;

  const ProductDetailScreen({super.key, required this.idProduct, required this.price});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductDetailCubit>(
      create: (context) => ProductDetailCubit(),
      child: ProductDetailScreenBody(idProduct: idProduct, price: price,),
    );
  }
}

class ProductDetailScreenBody extends StatefulWidget {
  final int idProduct;
  final int price;

  const ProductDetailScreenBody({super.key, required this.idProduct, required this.price});

  @override
  State<ProductDetailScreenBody> createState() =>
      _ProductDetailScreenBodyState();
}

class _ProductDetailScreenBodyState extends State<ProductDetailScreenBody> {
  late ProductDetailCubit productDetailCubit;

  @override
  void initState() {
    super.initState();
    productDetailCubit = BlocProvider.of(context);
    productDetailCubit.getProduct(widget.idProduct);
    productDetailCubit.getQuanAndTotalPrice(widget.price);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<ProductDetailCubit, ProductDetailState>(
        builder: (context, state) {
          if (state.productDetailStatus == LoadStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.productDetailStatus == LoadStatus.success) {
            return Stack(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height,
                ),
                SizedBox(
                  height: size.height * 0.6,
                  child: PageView.builder(
                      controller: productDetailCubit.pageController,
                      itemCount: 3,
                      onPageChanged: productDetailCubit.onChangedPage,
                      itemBuilder: (context, index) {
                        return Image.network(
                          state.productEntity!.images![index],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      }),
                ),
                Positioned(
                  top: 40,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: SvgPicture.asset(
                            AppImages.icBack,
                            width: 50,
                            height: 50,
                          ),
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          AppImages.icBagWhite,
                          width: 30,
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: size.height * 0.5 + 20,
                  right: size.width * 0.5 - 22,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => buildDot(index, state.curlIndex, context),
                    ),
                  ),
                ),
                Positioned(
                  bottom: size.height * 0.5 + 20,
                  right: size.width * 0.5 - 180,
                  child: SvgPicture.asset(
                    AppImages.icLoveWhite,
                    width: 30,
                    height: 30,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: size.width,
                        height: size.height / 2,
                        padding: const EdgeInsets.all(25),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextBold(
                                    text: state.productEntity?.title ?? '',
                                    textSize: 18),
                                const SizedBox(height: 5),
                                TextNormal(
                                    text: state.productEntity?.title ?? '',
                                    textSize: 11),
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
                                        text: '(320 Review)', textSize: 11),
                                  ],
                                ),
                                const Spacer(),
                                const TextBold(text: 'Size', textSize: 16),
                                const SizedBox(height: 10),
                                const SizedBox(
                                  width: 250,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizeButton(textButton: 'S'),
                                      SizeButton(textButton: 'M'),
                                      SizeButton(textButton: 'L'),
                                      SizeButton(textButton: 'XL'),
                                      SizeButton(textButton: 'XXL'),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                const TextBold(
                                    text: 'Description', textSize: 16),
                                const SizedBox(height: 10),
                                TextNormal(
                                    text:
                                        state.productEntity?.description ?? '',
                                    textSize: 11),
                                const Spacer(),
                                const TextNormal(
                                    text: 'Total Price', textSize: 9),
                                TextBold(
                                    text:
                                        '\$${state.totalPrice}.00',
                                    textSize: 18),
                              ],
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: SizedBox(
                                height: 250,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(

                                      decoration: const BoxDecoration(
                                          color: Color(0xffeeeeee),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              productDetailCubit.decrement();
                                            },
                                            child: Padding(
                                              padding:  EdgeInsets.symmetric(horizontal: 13.0, vertical: 13),
                                              child: SvgPicture.asset(
                                                AppImages.icMinus,
                                                width: 2,
                                                height: 2,
                                              ),
                                            ),
                                          ),
                                          TextBold(text: '${state.quantity}', textSize: 16),
                                          GestureDetector(
                                            onTap: () {
                                              productDetailCubit.increment();
                                            },
                                            child: Padding(
                                              padding:  EdgeInsets.symmetric(horizontal: 13.0, vertical: 13),
                                              child: SvgPicture.asset(
                                                AppImages.icPlus,
                                                width: 10,
                                                height: 10,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ),
                                    const TextBold(
                                        text: 'Avalible in stok', textSize: 14),
                                    Container(
                                      height: 132,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(30)),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.1),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(0, 4),
                                            ),
                                          ]),
                                      child: const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SelectColorButton(
                                              colorButton: 0xffffffff),
                                          SelectColorButton(
                                              colorButton: 0xff000000),
                                          SelectColorButton(
                                              colorButton: 0xffCADCA8),
                                          SelectColorButton(
                                              colorButton: 0xfff7a01f),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 30),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xff000000),
                                    width: 1,
                                  ),
                                  color: const Color(0xff000000),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AppImages.icBagBlack),
                                    const SizedBox(width: 10),
                                    Text(
                                      'Add to cart',
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xffffffff)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

}
