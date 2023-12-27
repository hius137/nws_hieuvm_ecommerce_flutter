import 'package:bloc/bloc.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/network/api_service.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/home/home_navigator.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/page/home/home_state.dart';
import 'package:nws_hieuvm_ecommerce_flutter/utils/logger.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.navigator}) : super(const HomeState());
  final HomeNavigator navigator;
}
