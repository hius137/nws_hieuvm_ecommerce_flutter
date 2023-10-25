import 'package:equatable/equatable.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/categories_entity.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';

class HomeState extends Equatable {
  final LoadStatus categoriesStatus;
  final List<CategoriesEntity>? listCategories;


  @override
  List<Object?> get props => [
    categoriesStatus,
    listCategories,
  ];

  const HomeState({
    this.categoriesStatus = LoadStatus.initial,
    this.listCategories,
  });

  HomeState copyWith({
    LoadStatus? categoriesStatus,
    List<CategoriesEntity>? listCategories,
  }) {
    return HomeState(
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
      listCategories: listCategories ?? this.listCategories,
    );
  }
}
