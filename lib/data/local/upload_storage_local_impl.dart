import 'dart:io';

import 'package:chat_app/data/upload_storage_repository.dart';

class UploadStorageLocalImpl extends UploadStorageRepository {
  @override
  Future<String> uploadPhoto(File file, String path) async {
    return "https://s3.amazonaws.com/uifaces/faces/twitter/kennyadr/128.jpg";
  }
}
