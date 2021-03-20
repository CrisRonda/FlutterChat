import 'package:chat_app/data/stream_api_repository.dart';
import 'package:chat_app/domain/models/chat_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatUserState {
  const ChatUserState(this.chatUser, {this.seleted = false});
  final ChatUser chatUser;
  final bool seleted;
}

class FriendSelectionCubit extends Cubit<List<ChatUserState>> {
  FriendSelectionCubit(this._streamApiRepository) : super([]);

  final StreamApiRepository _streamApiRepository;
  List<ChatUserState> get selectedUsers =>
      state.where((user) => user.seleted).toList();

  Future<void> getUsers() async {
    final chatUsers = (await _streamApiRepository.getChatUsers())
        .map((e) => ChatUserState(e))
        .toList();
    emit(chatUsers);
  }

  void selectUser(ChatUserState selecteduser) {
    final index = state.indexWhere(
        (element) => element.chatUser.id == selecteduser.chatUser.id);
    state[index] =
        ChatUserState(state[index].chatUser, seleted: !selecteduser.seleted);
    emit(List<ChatUserState>.from(state));
  }

  Future<Channel> createFriendChanel(ChatUserState chatUserState) async {
    return await _streamApiRepository
        .createSimpleChat(chatUserState.chatUser.id);
  }
}

class FriendsGroupCubit extends Cubit<bool> {
  FriendsGroupCubit() : super(false);

  void changeToGroup() => emit(!state);
}
