import 'dart:io';

import 'package:chat_app/data/upload_storage_repository.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebaseStorage;

class UploadStorageImpl extends UploadStorageRepository {
  @override
  Future<String> uploadPhoto(File file, String path) async {
    final ref = firebaseStorage.FirebaseStorage.instance.ref(path);
    final uploadTask = ref.putFile(file);
    await uploadTask;
    return await ref.getDownloadURL();
  }
}
