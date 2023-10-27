import 'package:equatable/equatable.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/user/user_entity.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';

class SignUpState extends Equatable {
  final LoadStatus signUpStatus;
  final UserEntity? userEntity;
  final bool isChecked;

  @override
  List<Object?> get props => [
        userEntity,
        isChecked,
        signUpStatus,
      ];

  const SignUpState({
    this.userEntity,
    this.signUpStatus = LoadStatus.initial,
    this.isChecked = false,
  });

  SignUpState copyWith({
    UserEntity? userEntity,
    bool? isChecked,
    LoadStatus? signUpStatus,
  }) {
    return SignUpState(
      userEntity: userEntity ?? this.userEntity,
      isChecked: isChecked ?? this.isChecked,
      signUpStatus: signUpStatus ?? this.signUpStatus,
    );
  }
}
