import 'package:equatable/equatable.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/user/user_entity.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';

class AppState extends Equatable {
  final LoadStatus signOutStatus;
  final UserEntity? userEntity;
  final bool checkLogin;
  final String? accessToken;

  @override
  List<Object?> get props => [
        signOutStatus,
        checkLogin,
        userEntity,
        accessToken,
      ];

  AppState removeUser() {
    return AppState(userEntity: userEntity);
  }

  const AppState({
    this.signOutStatus = LoadStatus.initial,
    this.userEntity,
    this.checkLogin = false,
    this.accessToken,
  });

  AppState copyWith({
    LoadStatus? signOutStatus,
    String? accessToken,
    bool? checkLogin,
    UserEntity? userEntity,
  }) {
    return AppState(
      signOutStatus: signOutStatus ?? this.signOutStatus,
      checkLogin: checkLogin ?? this.checkLogin,
      userEntity: userEntity ?? this.userEntity,
      accessToken: accessToken ?? this.accessToken,
    );
  }
}
