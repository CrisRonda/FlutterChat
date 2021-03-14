import 'dart:io';
import 'package:chat_app/data/image_picker_repository.dart';
import 'package:chat_app/domain/usecases/profile_signin_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileState {
  const ProfileState(this.file, {this.success = false});
  final File file;
  final bool success;
}

class ProfileVerifyCubit extends Cubit<ProfileState> {
  ProfileVerifyCubit(this._imagePickerRepository, this._profileSigninUseCase)
      : super(ProfileState(null));

  final nameController = TextEditingController();

  final ImagePickerRepository _imagePickerRepository;
  final ProfileSigninUseCase _profileSigninUseCase;

  void startChating() async {
    await Future.delayed(Duration(seconds: 1));
    final file = state.file;
    final name = nameController.text;
    _profileSigninUseCase.verify(ProfileInput(file, name));
    emit(ProfileState(file, success: true));
  }

  void pickImage() async {
    final file = await _imagePickerRepository.pickImage();
    emit(ProfileState(file));
  }
}
