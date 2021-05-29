import 'dart:io';

import 'package:chat_app/data/auth_repository.dart';
import 'package:chat_app/data/stream_api_repository.dart';
import 'package:chat_app/data/upload_storage_repository.dart';
import 'package:chat_app/domain/models/chat_user.dart';

class ProfileInput {
  ProfileInput(this.image, this.name);
  final File image;
  final String name;
}

class ProfileSigninUseCase {
  ProfileSigninUseCase(this._authRepository, this._streamApiRepository,
      this._uploadStorageRepository);
  final AuthRepository _authRepository;
  final StreamApiRepository _streamApiRepository;
  final UploadStorageRepository _uploadStorageRepository;

  Future<void> verify(ProfileInput input) async {
    final userAuth = await _authRepository.getAuthUser();
    if (userAuth.id != null) {
      final token = await _streamApiRepository.getToken(userAuth.id);
      String image;
      if (input.image != null) {
        image = await _uploadStorageRepository.uploadPhoto(
            input.image, 'users/${userAuth.id}');
      }
      final result = await _streamApiRepository.connectUser(
          ChatUser(name: input.name, id: userAuth.id, image: image), token);
      print(result.toString());
    }
  }
}
