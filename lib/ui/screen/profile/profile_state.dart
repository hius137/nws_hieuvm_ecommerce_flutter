part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final LoadStatus loadStatus;

  @override
  List<Object?> get props => [
    loadStatus,
  ];

  const ProfileState({
    this.loadStatus = LoadStatus.initial,
  });

  ProfileState copyWith({
    LoadStatus? loadStatus,
  }) {
    return ProfileState(
      loadStatus: loadStatus ?? this.loadStatus,
    );
  }
}