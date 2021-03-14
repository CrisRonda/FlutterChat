import 'package:chat_app/domain/usecases/logout_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsSwitchCubit extends Cubit<bool> {
  SettingsSwitchCubit(state) : super(state);
  void onChangeTheme(bool isDark) => emit(isDark);
}

class SettingsLogoutCubit extends Cubit<void> {
  SettingsLogoutCubit(this._logoutUsecase) : super(null);
  final LogoutUsecase _logoutUsecase;
  void logout() async {
    await _logoutUsecase.logout();
    emit(null);
  }
}
