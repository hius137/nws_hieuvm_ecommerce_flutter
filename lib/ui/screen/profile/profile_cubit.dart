import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nws_hieuvm_ecommerce_flutter/app_cubit.dart';
import 'package:nws_hieuvm_ecommerce_flutter/database/share_preferences_helper.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/user/user_entity.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/enums/load_status.dart';
import 'package:nws_hieuvm_ecommerce_flutter/ui/screen/profile/profile_navigator.dart';
import 'package:nws_hieuvm_ecommerce_flutter/utils/logger.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.appCubit, required this.navigator}) : super(const ProfileState());
  final AppCubit appCubit;
  final ProfileNavigator navigator;

  Future<void> getUser() async {
    emit(
      state.copyWith(loadStatus: LoadStatus.loading),
    );
    try {
      if (appCubit.state.userEntity != null) {
        emit(state.copyWith(
          user: appCubit.state.userEntity,
          loadStatus: LoadStatus.success,
        ));
      }
    } catch (e) {
      emit(
        state.copyWith(loadStatus: LoadStatus.failure),
      );
    }
  }

  Future<void> signOut() async {
    try{
      SharedPreferencesHelper.removeAccessToken();
      appCubit.signOut();
      navigator.navSignIn();
    }catch(e){
      logger.e(e);
    }
  }

}
