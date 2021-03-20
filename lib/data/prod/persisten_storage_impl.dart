import 'package:chat_app/data/persisten_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersistenStorageImpl extends PersistentStorageRepository {
  @override
  Future<bool> isDarkMode() async {
    final preference = await SharedPreferences.getInstance();
    return preference.getBool("isDarkMode") ?? false;
  }

  @override
  Future<void> updateDarkMode(bool isDark) async {
    final preference = await SharedPreferences.getInstance();

    return preference.setBool('isDarkMode', isDark);
  }
}
