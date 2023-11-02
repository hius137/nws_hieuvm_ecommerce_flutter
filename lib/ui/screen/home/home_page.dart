import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_hieuvm_ecommerce_flutter/database/firebase_firestore_service.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/home/home_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/home/home_state.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/home/widget/item_search.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/home/widget/list_categories.dart';
import 'package:nws_hieuvm_ecommerce_flutter/component/search_empty.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: const HomePageBody(),
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody>
    with AutomaticKeepAliveClientMixin {
  late HomeCubit homeCubit;
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
            child: BlocBuilder<HomeCubit, HomeState>(
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
