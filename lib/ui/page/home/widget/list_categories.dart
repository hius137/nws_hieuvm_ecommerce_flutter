import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/component/item_categories.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/categories_entity.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/product_list/product_list_page.dart';

class ListCategoriesView extends StatelessWidget {
  final List<CategoriesEntity>? listCategories;
  const ListCategoriesView({super.key, this.listCategories});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 15,
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        childAspectRatio: 0.75,
      ),
      itemCount: listCategories?.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductListPage(
                  idCategories: listCategories?[index]
                      .id ??
                      0,
                  nameCategories: listCategories?[index]
                      .name ??
                      '',
                ),
              ),
            );
          },
          child: ItemCategories(
            nameCategories:
            listCategories?[index].name ??
                '',
            imageCategories:
            listCategories?[index].image ??
                '',
            lengthCategories:  listCategories?[index]
                .totalProducts ??
                0,
          ),
        );
      },
    );
  }
}
