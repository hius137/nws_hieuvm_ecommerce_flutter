import 'package:equatable/equatable.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';

class SplashState extends Equatable {
  final LoadStatus loadStatus;

  @override
  List<Object?> get props => [
        loadStatus,
      ];

  const SplashState({
    this.loadStatus = LoadStatus.initial,
  });

  SplashState copyWith({
    LoadStatus? loadStatus,
  }) {
    return SplashState(
      loadStatus: loadStatus ?? this.loadStatus,
    );
  }
}
