import 'package:chat_app/data/persisten_storage_repository.dart';

class PersistenStorageLocalImpl extends PersistentStorageRepository {
  @override
  Future<bool> isDarkMode() async {
    await Future.delayed(Duration(microseconds: 49));
    return false;
  }

  @override
  Future<void> updateDarkMode(bool isDark) async {
    await Future.delayed(Duration(microseconds: 49));
    return;
  }
}
