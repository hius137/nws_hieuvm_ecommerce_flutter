import 'package:equatable/equatable.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/categories_entity.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';

class HomeState extends Equatable {
  final LoadStatus categoriesStatus;
  final List<CategoriesEntity>? currentCategories;
  final List<CategoriesEntity>? categories;

  @override
  List<Object?> get props => [
        categoriesStatus,
        currentCategories,
        categories,
      ];

  const HomeState({
    this.categoriesStatus = LoadStatus.initial,
    this.currentCategories,
    this.categories,
  });

  HomeState copyWith({
    LoadStatus? categoriesStatus,
    List<CategoriesEntity>? currentCategories,
    List<CategoriesEntity>? categories,
  }) {
    return HomeState(
        categoriesStatus: categoriesStatus ?? this.categoriesStatus,
        currentCategories: currentCategories ?? this.currentCategories,
        categories: categories ?? this.categories);
  }
}
