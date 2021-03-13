import 'package:chat_app/ui/friend_selection/friend_selection_cubit.dart';
import 'package:chat_app/ui/friend_selection/group_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupSelectionView extends StatelessWidget {
  GroupSelectionView(this.selectedUsers);

  final List<ChatUserState> selectedUsers;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GroupSelectionCubit(selectedUsers),
      child: BlocConsumer<GroupSelectionCubit, GroupSelectionState>(
          listener: (context, snap) {
        // call to chat view
      }, builder: (context, snapshot) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Verify your identity"),
                Placeholder(
                  fallbackHeight: 111,
                  fallbackWidth: 111,
                ),
                IconButton(icon: Icon(Icons.photo), onPressed: () {}),
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
                              CircleAvatar(),
                              Text(selectedUsers[index].chatUser.name)
                            ],
                          )),
                ),
                ElevatedButton(onPressed: () {}, child: Text("Next"))
              ],
            ),
          ),
        );
      }),
    );
  }
}
