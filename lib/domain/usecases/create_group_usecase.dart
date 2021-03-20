import 'dart:io';

import 'package:chat_app/data/stream_api_repository.dart';
import 'package:chat_app/data/upload_storage_repository.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:uuid/uuid.dart';

class CreateGroupInput {
  CreateGroupInput(this.imageFile, this.name, this.members);
  final File imageFile;
  final String name;
  final List<String> members;
}

class CreateGroupUseCase {
  CreateGroupUseCase(this._streamApiRepository, this._uploadStorageRepository);

  final StreamApiRepository _streamApiRepository;
  final UploadStorageRepository _uploadStorageRepository;

  Future<Channel> createGroup(CreateGroupInput input) async {
    final channelId = Uuid().v4();
    String imageResult;
    if (input.imageFile != null) {
      imageResult = await _uploadStorageRepository.uploadPhoto(
          input.imageFile, "channels");
    }
    final channel = await _streamApiRepository.createGroupChat(
        channelId, input.name, input.members,
        image: imageResult);
    return channel;
  }
}
