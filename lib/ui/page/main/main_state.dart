part of 'main_cubit.dart';

class MainState extends Equatable {
  final int curlIndex;
  @override
  List<Object?> get props => [
    curlIndex,
  ];

  const MainState({
    this.curlIndex = 0,
  });

  MainState copyWith({
    int? curlIndex,
  }) {
    return MainState(
      curlIndex: curlIndex ?? this.curlIndex,
    );
  }
}