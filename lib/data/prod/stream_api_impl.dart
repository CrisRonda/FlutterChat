import 'dart:convert';

import 'package:chat_app/data/stream_api_repository.dart';
import 'package:chat_app/domain/models/chat_user.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

class StreamApiImpl extends StreamApiRepository {
  StreamApiImpl(this._client);
  final StreamChatClient _client;

  @override
  Future<bool> connectIfExist(String userId) async {
    final token = await getToken(userId);
    await _client.connectUser(User(id: userId), token);
    print("&&&&&&&&&&&");
    print(_client.state.user);
    print("&&&&&&&&&&&");
    return _client.state.user.name != null;
  }

  @override
  Future<ChatUser> connectUser(ChatUser user, String token) async {
    Map<String, dynamic> extraData = {};
    if (user.image != null) {
      extraData['image'] = user.image;
    }
    if (user.name != null) {
      extraData['name'] = user.name;
    }
    await _client.disconnect();
    await _client.connectUser(User(id: user.id, extraData: extraData), token);
    return user;
  }

  @override
  Future<Channel> createGroupChat(
      String channelId, String name, List<String> members,
      {String image}) async {
    final channel = _client.channel('messaging', id: channelId, extraData: {
      'name': name,
      'image': image,
      'members': [_client.state.user.id, ...members],
    });
    await channel.watch();
    return channel;
  }

  @override
  Future<Channel> createSimpleChat(String friendId) async {
    final channel = _client.channel('messaging',
        id: '${_client.state.user.id.hashCode}${friendId.hashCode}',
        extraData: {
          'members': [friendId, _client.state.user.id],
        });
    await channel.watch();
    return channel;
  }

  @override
  Future<String> getToken(String userId) async {
    try {
      final response = await http.post(
          'https://polar-spire-24114.herokuapp.com/getToken',
          headers: <String, String>{
            "Content-Type": "application/json; charset=UTF-8"
          },
          body: jsonEncode(<String, String>{'userId': userId}));
      final token = jsonDecode(response.body)['token'];
      return token;
    } catch (e) {
      print(e);
      return 'error';
    }
  }

  @override
  Future<List<ChatUser>> getChatUsers() async {
    final result = await _client.queryUsers();
    final chatUsers = result.users
        .where((element) => element.id != _client.state.user.id)
        .map((e) =>
            ChatUser(id: e.id, name: e.name, image: e.extraData['image']))
        .toList();
    return chatUsers;
  }

  @override
  Future<void> logout() {
    return _client.disconnect();
  }
}
