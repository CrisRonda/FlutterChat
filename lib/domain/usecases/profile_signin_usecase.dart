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
    final auth = await _authRepository.getAuthUser();
    if (auth.id != null) {
      final token = await _streamApiRepository.getToken(auth.id);
      String image;
      if (input.image != null) {
        image = await _uploadStorageRepository.uploadPhoto(
            input.image, 'users/${auth.id}');
      }
      final result = await _streamApiRepository.connectUser(
          ChatUser(name: input.name, id: auth.id, image: image), token);
      print(result.toString());
    }
  }
}
