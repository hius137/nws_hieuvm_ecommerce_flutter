part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  final LoadStatus signInStatus;

  @override
  List<Object?> get props => [
        signInStatus,
      ];

  const SignInState({
    this.signInStatus = LoadStatus.initial,
  });

  SignInState copyWith({
    LoadStatus? signInStatus,
  }) {
    return SignInState(
      signInStatus: signInStatus ?? this.signInStatus,
    );
  }
}
