import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileState {
  const ProfileState(this.file, {this.success = false});
  final File file;
  final bool success;
}

class ProfileVerifyCubit extends Cubit<ProfileState> {
  ProfileVerifyCubit() : super(ProfileState(null));
  final nameController = TextEditingController();
  void startChating() async {
    await Future.delayed(Duration(seconds: 2));
    final file = state.file;
    final name = nameController.text;
    emit(ProfileState(file, success: true));
  }

  void pickImage() {
    final file = File('');
    emit(ProfileState(file));
  }
}
