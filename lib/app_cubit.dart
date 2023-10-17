import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nws_hieuvm_ecommerce_flutter/app_state.dart';
import 'package:nws_hieuvm_ecommerce_flutter/database/firebase_firestore_service.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());
}