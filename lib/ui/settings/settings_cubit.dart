import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsSwitchCubit extends Cubit<bool> {
  SettingsSwitchCubit(state) : super(state);
  void onChangeTheme(bool isDark) => emit(isDark);
}

class SettingsLogoutCubit extends Cubit<void> {
  SettingsLogoutCubit() : super(null);
  void logout() {
    print("Call to firebase logout");
    emit(null);
  }
}
