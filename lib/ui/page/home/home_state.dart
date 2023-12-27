import 'package:equatable/equatable.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/categories_entity.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';

class HomeState extends Equatable {
  final LoadStatus homeStatus;

  @override
  List<Object?> get props => [
        homeStatus,
      ];

  const HomeState({
    this.homeStatus = LoadStatus.initial,
  });

  HomeState copyWith({
    LoadStatus? homeStatus,
  }) {
    return HomeState(
      homeStatus: homeStatus ?? this.homeStatus,
    );
  }
}
