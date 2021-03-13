import 'package:chat_app/domain/models/chat_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatUserState {
  const ChatUserState(this.chatUser, {this.seleted = false});
  final ChatUser chatUser;
  final bool seleted;
}

class FriendSelectionCubit extends Cubit<List<ChatUserState>> {
  FriendSelectionCubit() : super([]);

  List<ChatUserState> get selectedUsers =>
      state.where((user) => user.seleted).toList();

  Future<void> getUsers() async {
    final list = List.generate(
        14,
        (index) =>
            ChatUserState(ChatUser(name: "Item $index", id: index.toString())));
    emit(list);
  }

  void selectUser(ChatUserState selecteduser) {
    final index = state.indexWhere(
        (element) => element.chatUser.id == selecteduser.chatUser.id);
    state[index] =
        ChatUserState(state[index].chatUser, seleted: !selecteduser.seleted);
    emit(List<ChatUserState>.from(state));
  }

  Future<Channel> createFriendChanel(ChatUserState chatUserState) async {
    print("createFriendChanel...");
  }
}

class FriendsGroupCubit extends Cubit<bool> {
  FriendsGroupCubit() : super(false);

  void changeToGroup() => emit(!state);
}
