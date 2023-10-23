part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final LoadStatus loadStatus;
  final UserEntity? user;

  @override
  List<Object?> get props => [
    loadStatus,
    user,
  ];

  const ProfileState({
    this.loadStatus = LoadStatus.initial,
    this.user,
  });

  ProfileState copyWith({
    LoadStatus? loadStatus,
    UserEntity? user,
  }) {
    return ProfileState(
      loadStatus: loadStatus ?? this.loadStatus,
      user: user ?? this.user,
    );
  }
}