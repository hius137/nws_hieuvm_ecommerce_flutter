import 'package:equatable/equatable.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/user/user_entity.dart';

class SignUpState extends Equatable {
  final UserEntity? userEntity;
  final bool isChecked;

  @override
  List<Object?> get props => [
        userEntity,
    isChecked,
      ];

  const SignUpState({
    this.userEntity,
    this.isChecked = false,
  });

  SignUpState copyWith({
    UserEntity? userEntity,
    bool? isChecked,
  }) {
    return SignUpState(
      userEntity: userEntity ?? this.userEntity,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}
