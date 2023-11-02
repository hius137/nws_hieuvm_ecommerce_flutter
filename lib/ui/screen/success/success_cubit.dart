import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/success/success_navigator.dart';

part 'success_state.dart';

class SuccessfulCubit extends Cubit<SuccessfulState> {
  SuccessfulCubit({required this.navigator}) : super(SuccessfulState());
  final SuccessNavigator navigator;

}
