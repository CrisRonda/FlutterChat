import 'dart:io';

import 'package:chat_app/data/image_picker_repository.dart';
import 'package:chat_app/domain/usecases/create_group_usecase.dart';
import 'package:chat_app/ui/friend_selection/friend_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class GroupSelectionState {
  const GroupSelectionState(this.file, {this.channel, this.image});
  final File file;
  final Channel channel;
  final File image;
}

class GroupSelectionCubit extends Cubit<GroupSelectionState> {
  GroupSelectionCubit(
      this.members, this._createGroupUseCase, this._imagePickerRepository)
      : super(null);

  final CreateGroupUseCase _createGroupUseCase;
  final ImagePickerRepository _imagePickerRepository;
  final List<ChatUserState> members;
  final nameTextController = TextEditingController();

  void createGroup() async {
    final channel = await _createGroupUseCase.createGroup(CreateGroupInput(
        state.file,
        nameTextController.text,
        members.map((e) => e.chatUser.id).toList()));
    emit(GroupSelectionState(state.file, channel: channel));
  }

  void pickImage() async {
    final image = await _imagePickerRepository.pickImage();
    emit(GroupSelectionState(image));
  }
}
