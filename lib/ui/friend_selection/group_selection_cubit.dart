import 'dart:io';

import 'package:chat_app/ui/friend_selection/friend_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupSelectionState {
  const GroupSelectionState(this.file, {this.channel});
  final File file;
  final bool channel;
}

class GroupSelectionCubit extends Cubit<GroupSelectionState> {
  GroupSelectionCubit(this.members) : super(null);

  final List<ChatUserState> members;
  final nameTextController = TextEditingController();

  void createGroup() {
    emit(GroupSelectionState(state.file, channel: null));
  }

  void pickImage() {
    emit(GroupSelectionState(null));
  }
}
