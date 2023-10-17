part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class LoginInitial extends AuthState {
  @override
  List<Object> get props => [];
}
