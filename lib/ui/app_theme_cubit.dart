import 'package:chat_app/data/persisten_storage_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppThemeCubit extends Cubit<bool> {
  AppThemeCubit(this._persistentStorageRepository) : super(false);

  final PersistentStorageRepository _persistentStorageRepository;

  bool _isDark = false;
  bool get isDarkMode => _isDark;

  Future<void> init() async {
    _isDark = await _persistentStorageRepository.isDarkMode();
    emit(_isDark);
  }

  Future<void> updateDarkMode(bool isDark) async {
    _isDark = isDark;
    print("Actualizando theme...$isDarkMode");
    await _persistentStorageRepository.updateDarkMode(isDark);
    emit(isDark);
  }
}
