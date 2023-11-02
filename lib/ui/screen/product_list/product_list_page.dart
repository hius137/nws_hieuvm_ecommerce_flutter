import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/product_list/product_list_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/product_list/widget/list_product_body.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/product_list/widget/widget_header.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/app_text.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({
    super.key,
    required this.idCategories,
    required this.nameCategories,
  });

  final int idCategories;
  final String nameCategories;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductListCubit>(
      create: (context) => ProductListCubit(),
      child: ProductListPageBody(
        idCategories: idCategories,
        nameCategories: nameCategories,
      ),
    );
  }
}

class ProductListPageBody extends StatefulWidget {
  final int idCategories;
  final String nameCategories;

  const ProductListPageBody({
    super.key,
    required this.idCategories,
    required this.nameCategories,
  });

  @override
  State<ProductListPageBody> createState() => _ProductListPageBodyState();
}

class _ProductListPageBodyState extends State<ProductListPageBody> {
  late ProductListCubit productListCubit;


  @override
  void initState() {
    super.initState();
    productListCubit = BlocProvider.of(context);
    productListCubit.getListProducts(widget.idCategories);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const WidgetHeader(),
            const SizedBox(height: 30),
            _title(),
            const SizedBox(height: 10),
            const ListProductBody(),
          ],
        ),
      ),
    );
  }

  Widget _title(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextBold(
          text: widget.nameCategories,
          textSize: 20,
          color: 0xff000000,
        ),
      ],
    );
  }

  @override
  void dispose() {
    productListCubit.close();
    super.dispose();
  }
}
