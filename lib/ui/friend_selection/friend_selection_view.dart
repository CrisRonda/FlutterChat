import 'package:chat_app/navigator_utils.dart';
import 'package:chat_app/ui/chat/chat_view.dart';
import 'package:chat_app/ui/friend_selection/friend_selection_cubit.dart';
import 'package:chat_app/ui/friend_selection/group_selection_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class FrinedSelectionView extends StatelessWidget {
  void _createFriendChannel(
      BuildContext context, ChatUserState userInGroup) async {
    final channel = await context
        .read<FriendSelectionCubit>()
        .createFriendChanel(userInGroup);
    pushAndReplacePage(
        context,
        Scaffold(
          body: StreamChannel(
            channel: channel,
            child: ChannelPage(),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                FriendSelectionCubit(context.read())..getUsers()),
        BlocProvider(create: (_) => FriendsGroupCubit()),
      ],
      child: BlocBuilder<FriendsGroupCubit, bool>(builder: (context, isGroup) {
        return BlocBuilder<FriendSelectionCubit, List<ChatUserState>>(
            builder: (context, usersInGroup) {
          final selectedUsers =
              context.read<FriendSelectionCubit>().selectedUsers;
          return Scaffold(
              floatingActionButton: isGroup && selectedUsers.isNotEmpty
                  ? FloatingActionButton(
                      onPressed: () {
                        pushAndReplacePage(
                            context, GroupSelectionView(selectedUsers));
                      },
                      child: Icon(Icons.skip_next),
                    )
                  : null,
              body: Column(
                children: [
                  SizedBox(
                    height: 32,
                  ),
                  if (isGroup)
                    Row(
                      children: [
                        BackButton(
                          onPressed: () {
                            context.read<FriendsGroupCubit>().changeToGroup();
                          },
                        ),
                        Text("New Group")
                      ],
                    )
                  else
                    Row(
                      children: [
                        BackButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  if (!isGroup)
                    ElevatedButton(
                        onPressed: () {
                          context.read<FriendsGroupCubit>().changeToGroup();
                        },
                        child: Text("Create group"))
                  else if (isGroup && selectedUsers.isEmpty)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [CircleAvatar(), Text("Add friend")],
                    )
                  else
                    SizedBox(
                      height: 68,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: selectedUsers.length,
                          itemBuilder: (context, index) {
                            final chatUserState = selectedUsers[index];
                            return Stack(
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(),
                                    Text(chatUserState.chatUser.name)
                                  ],
                                ),
                                IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      context
                                          .read<FriendSelectionCubit>()
                                          .selectUser(chatUserState);
                                    })
                              ],
                            );
                          }),
                    ),
                  if (usersInGroup.isEmpty)
                    Text("Add friends in your chat 😁")
                  else
                    Expanded(
                        child: ListView.builder(
                      itemCount: usersInGroup.length,
                      itemBuilder: (contex, index) {
                        final userInGroup = usersInGroup[index];
                        print("imagen");
                        return ListTile(
                          onTap: () {
                            _createFriendChannel(contex, userInGroup);
                          },
                          leading: CircleAvatar(
                            backgroundImage: userInGroup.chatUser.image != null
                                ? NetworkImage(userInGroup.chatUser.image)
                                : NetworkImage(
                                    "https://cdn2.iconfinder.com/data/icons/4web-3/139/header-account-image-line-512.png"),
                          ),
                          title: Text(userInGroup.chatUser.name),
                          trailing: isGroup
                              ? Checkbox(
                                  value: userInGroup.seleted,
                                  onChanged: (value) {
                                    context
                                        .read<FriendSelectionCubit>()
                                        .selectUser(userInGroup);
                                  })
                              : null,
                        );
                      },
                    ))
                ],
              ));
        });
      }),
    );
  }
}
