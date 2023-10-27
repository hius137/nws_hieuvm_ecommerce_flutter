import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_image.dart';
import 'package:nws_hieuvm_ecommerce_flutter/database/firebase_firestore_service.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/home/home_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/home/home_state.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/product_list/product_list_screen.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/widget/item/item_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: const HomeScreenBody(),
    );
  }
}

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody>
    with AutomaticKeepAliveClientMixin {
  late HomeCubit homeCubit;
  late FireStoreService fireStoreService = FireStoreService();
  final _searchCategoriesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    homeCubit = BlocProvider.of(context);
    homeCubit.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: SvgPicture.asset(
                    AppImages.icBack,
                    width: 50,
                    height: 50,
                  ),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: _searchCategoriesController,
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
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10,),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 20,
                      minHeight: 20,
                    ),
                  ),
                  onChanged: (value) {
                    // homeCubit.addSearchedFOrItemsToSearchedList(value);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) => previous.categoriesStatus != current.categoriesStatus,
                builder: (context, state) {
                  if (state.categoriesStatus == LoadStatus.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.categoriesStatus == LoadStatus.success) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 15,
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: state.listCategories?.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // fireStoreService.addUser();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductListScreen(
                                  idCategories:
                                      state.listCategories?[index].id ?? 0,
                                  nameCategories:
                                      state.listCategories?[index].name ?? '',
                                ),
                              ),
                            );
                          },
                          child: ItemCategories(
                            nameCategories:
                                state.listCategories?[index].name ?? '',
                            imageCategories:
                                state.listCategories?[index].image ?? '',
                            lenghtCategories:
                                state.listCategories?[index].totalProducts ?? 0,
                          ),
                        );
                      },
                      addAutomaticKeepAlives: true,
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
