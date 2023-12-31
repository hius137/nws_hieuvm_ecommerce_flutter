
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_hieuvm_ecommerce_flutter/database/firebase_firestore_service.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/categories/categories_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/categories/categories_state.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/categories/widget/item_search.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/categories/widget/list_categories.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/categories/widget/search_empty.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriesCubit>(
      create: (context) => CategoriesCubit(),
      child: const CategoriesPageBody(),
    );
  }
}

class CategoriesPageBody extends StatefulWidget {
  const CategoriesPageBody({super.key});

  @override
  State<CategoriesPageBody> createState() => _CategoriesPageBodyState();
}

class _CategoriesPageBodyState extends State<CategoriesPageBody>
    with AutomaticKeepAliveClientMixin {
  late CategoriesCubit homeCubit;
  late FireStoreService fireStoreService = FireStoreService();
  final searchCategoriesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    homeCubit = BlocProvider.of(context);
    homeCubit.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          SearchTextField(searchCategoriesController: searchCategoriesController, onChange: homeCubit.searchCategories,),
          const SizedBox(height: 20),
          Expanded(
            child: BlocBuilder<CategoriesCubit, CategoriesState>(
              buildWhen: (previous, current) =>
              previous.currentCategories != current.currentCategories,
              builder: (context, state) {
                if (state.categoriesStatus == LoadStatus.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.categoriesStatus == LoadStatus.success) {
                  return state.currentCategories!.isNotEmpty
                      ? ListCategoriesView(listCategories: state.currentCategories)
                      : const SearchEmpty();
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
  }
}
