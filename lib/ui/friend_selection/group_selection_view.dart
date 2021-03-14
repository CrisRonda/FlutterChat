import 'package:chat_app/data/image_picker_repository.dart';
import 'package:chat_app/navigator_utils.dart';
import 'package:chat_app/ui/chat/chat_view.dart';
import 'package:chat_app/ui/friend_selection/friend_selection_cubit.dart';
import 'package:chat_app/ui/friend_selection/group_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class GroupSelectionView extends StatelessWidget {
  GroupSelectionView(this.selectedUsers);

  final List<ChatUserState> selectedUsers;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GroupSelectionCubit(selectedUsers, context.read(), context.read()),
      child: BlocConsumer<GroupSelectionCubit, GroupSelectionState>(
          listener: (context, snap) {
        if (snap.channel != null) {
          pushAndReplacePage(
              context,
              Scaffold(
                body: StreamChannel(
                  channel: snap.channel,
                  child: ChannelPage(),
                ),
              ));
        }
      }, builder: (context, snapshot) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Verify your identity"),
                if (snapshot.file != null)
                  Image.file(
                    snapshot.file,
                    height: 200,
                  )
                else
                  Placeholder(
                    fallbackHeight: 111,
                    fallbackWidth: 111,
                  ),
                IconButton(
                    icon: Icon(Icons.photo),
                    onPressed: () {
                      context.read<ImagePickerRepository>().pickImage();
                    }),
                TextField(
                  controller:
                      context.read<GroupSelectionCubit>().nameTextController,
                  decoration: InputDecoration(hintText: "Name group"),
                ),
                Wrap(
                  children: List.generate(
                      selectedUsers.length,
                      (index) => Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    selectedUsers[index].chatUser.image),
                              ),
                              Text(selectedUsers[index].chatUser.name)
                            ],
                          )),
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<GroupSelectionCubit>().createGroup();
                    },
                    child: Text("Next"))
              ],
            ),
          ),
        );
      }),
    );
  }
}
