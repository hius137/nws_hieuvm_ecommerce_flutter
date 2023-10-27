import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nws_hieuvm_ecommerce_flutter/app_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/database/firebase_firestore_service.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/cart_entity.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/notification_entity.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/product_detail/product_detail_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/button.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/item/dot.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/snackbar.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/text.dart';

class ProductDetailScreen extends StatelessWidget {
  final int idProduct;
  final int price;

  const ProductDetailScreen(
      {super.key, required this.idProduct, required this.price});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductDetailCubit>(
      create: (context) => ProductDetailCubit(),
      child: ProductDetailScreenBody(
        idProduct: idProduct,
        price: price,
      ),
    );
  }
}

class ProductDetailScreenBody extends StatefulWidget {
  final int idProduct;
  final int price;

  const ProductDetailScreenBody(
      {super.key, required this.idProduct, required this.price});

  @override
  State<ProductDetailScreenBody> createState() =>
      _ProductDetailScreenBodyState();
}

class _ProductDetailScreenBodyState extends State<ProductDetailScreenBody> {
  late ProductDetailCubit productDetailCubit;
  late FireStoreService fireStoreService = FireStoreService();
  late CartEntity cartEntity;
  late NotificationEntity notificationEntity;
  late AppCubit _appCubit;
  List<int> colors = [0xffffffff, 0xff000000, 0xffCADCA8, 0xfff7a01f];
  List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];

  @override
  void initState() {
    super.initState();
    _appCubit = context.read<AppCubit>();
    productDetailCubit = BlocProvider.of(context);
    productDetailCubit.getProduct(widget.idProduct);
    productDetailCubit.getQuantityAndTotalPrice(widget.price);
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
                      (index) => buildDot(index, state.curlIndexDot, context),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                  SizedBox(
                                    width: 250,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: List.generate(
                                        sizes.length,
                                        (indexSize) => InkWell(
                                          onTap: () => productDetailCubit
                                              .onChangedSize(indexSize),
                                          child: Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: itemSize(
                                                indexSize,
                                                state.curlIndexSize,
                                                context,
                                                sizes),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  const TextBold(
                                      text: 'Description', textSize: 16),
                                  const SizedBox(height: 10),
                                  TextNormal(
                                      text: state.productEntity?.description ??
                                          '',
                                      textSize: 11),
                                  const Spacer(),
                                  const TextNormal(
                                    text: 'Total Price',
                                    textSize: 9,
                                  ),
                                  TextBold(
                                      text: '\$${state.totalPrice}.00',
                                      textSize: 18),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        decoration: const BoxDecoration(
                                            color: Color(0xffeeeeee),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                productDetailCubit.decrement();
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 13.0,
                                                        vertical: 13),
                                                child: SvgPicture.asset(
                                                  AppImages.icMinus,
                                                  width: 2,
                                                  height: 2,
                                                ),
                                              ),
                                            ),
                                            TextBold(
                                                text: '${state.quantity}',
                                                textSize: 16),
                                            InkWell(
                                              onTap: () {
                                                productDetailCubit.increment();
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 13.0,
                                                        vertical: 13),
                                                child: SvgPicture.asset(
                                                  AppImages.icPlus,
                                                  width: 10,
                                                  height: 10,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
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
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List.generate(
                                          colors.length,
                                          (index) => InkWell(
                                            onTap: () => productDetailCubit
                                                .onChangedColors(index),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              child: itemColor(
                                                  index,
                                                  state.curlIndexColor,
                                                  context,
                                                  colors),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 10,
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
                                    InkWell(
                                      onTap: () {
                                        cartEntity = CartEntity(
                                          idUser:
                                              _appCubit.state.userEntity?.id,
                                          nameProduct:
                                              state.productEntity?.title ?? '',
                                          price:
                                              state.productEntity?.price ?? 0,
                                          quantity: state.quantity,
                                          imageProduct:
                                              state.productEntity!.images![0],
                                        );
                                        notificationEntity = NotificationEntity(
                                            idUser:
                                                _appCubit.state.userEntity?.id,
                                            nameProduct:
                                                state.productEntity?.title ??
                                                    '',
                                            imageProduct: state.productEntity!
                                                    .images?[0] ??
                                                '',
                                            message:
                                                'You have successfully ordered the product ${state.productEntity?.title ?? ''}',timeOrder: DateTime.now().toString());

                                        fireStoreService.addToCart(cartEntity);
                                        fireStoreService.setNotification(
                                            notificationEntity);
                                        showSnackBar(context, 'Order success!');
                                      },
                                      child: Text(
                                        'Add to cart',
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xffffffff),
                                        ),
                                      ),
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
