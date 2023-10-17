import 'package:equatable/equatable.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/user/user_entity.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';

class AppState extends Equatable {
  final LoadStatus signInStatus;
  final UserEntity? userEntity;
  final bool checkLogin;
  final String? accessToken;

  @override
  List<Object?> get props => [
    signInStatus,
    checkLogin,
    userEntity,
    accessToken,
  ];

  const AppState({
    this.signInStatus = LoadStatus.initial,
    this.userEntity,
    this.checkLogin = false,
    this.accessToken,
  });

  AppState copyWith({
    LoadStatus? signInStatus,
String? accessToken,
    bool? checkLogin,
    UserEntity? userEntity,
  }) {
    return AppState(
      signInStatus: signInStatus ?? this.signInStatus,
      checkLogin: checkLogin ?? this.checkLogin,
      userEntity: userEntity ?? this.userEntity,
      accessToken: accessToken ?? this.accessToken,
    );
  }
}
