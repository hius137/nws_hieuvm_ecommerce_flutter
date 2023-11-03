import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/database/firebase_firestore_service.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/product_detail/product_detail_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/product_detail/product_detail_navigator.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/product_detail/widget/detail_product.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/product_detail/widget/header_item.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/product_detail/widget/list_dot.dart';

class ProductDetailPage extends StatelessWidget {
  final int idProduct;
  final int price;

  const ProductDetailPage(
      {super.key, required this.idProduct, required this.price});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductDetailCubit>(
      create: (context) {
        final fireStoreService = FireStoreService();
        final navigator = ProductDetailNavigator(context: context);
        return ProductDetailCubit(fireStoreService: fireStoreService, navigator: navigator);
      },
      child: ProductDetailPageBody(
        idProduct: idProduct,
        price: price,
      ),
    );
  }
}

class ProductDetailPageBody extends StatefulWidget {
  final int idProduct;
  final int price;

  const ProductDetailPageBody(
      {super.key, required this.idProduct, required this.price});

  @override
  State<ProductDetailPageBody> createState() => _ProductDetailPageBodyState();
}

class _ProductDetailPageBodyState extends State<ProductDetailPageBody> {
  late ProductDetailCubit productDetailCubit;
  List<int> colors = [0xffffffff, 0xff000000, 0xffCADCA8, 0xfff7a01f];
  List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    productDetailCubit = BlocProvider.of(context);
    productDetailCubit.getProduct(widget.idProduct);
    productDetailCubit.getQuantityAndTotalPrice(widget.price);
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBodyPage();
  }

  Widget _buildBodyPage() {
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
                    controller: _pageController,
                    itemCount: 3,
                    onPageChanged: productDetailCubit.onChangedPage,
                    itemBuilder: (context, index) {
                      return Image.network(
                        state.productEntity!.images![index],
                        width: double.infinity,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                const Positioned(
                  top: 40,
                  child: HeaderItem(),
                ),
                Positioned(
                  bottom: size.height * 0.5 + 20,
                  right: size.width * 0.5 - 22,
                  child: ListDot(curlIndexDot: state.curlIndexDot),
                ),
                Positioned(
                  bottom: size.height * 0.5 + 20,
                  right: 10,
                  child: SvgPicture.asset(
                    AppImages.icLoveWhite,
                    width: 30,
                    height: 30,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child:
                  DetailProduct(
                    totalPrice: state.totalPrice,
                    title: state.productEntity?.title ?? '',
                    curlIndexSize: state.curlIndexSize,
                    description: state.productEntity?.description ?? '',
                    quantity: state.quantity,
                    curlIndexColor:  state.curlIndexColor,
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

  @override
  void dispose() {
    productDetailCubit.close();
    super.dispose();
  }
}
