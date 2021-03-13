import 'package:flutter/material.dart';

class FrinedSelectionView extends StatelessWidget {
  final isGroup = false;
  // final selectedUsers = <ChatUser>[]
  final selectedUsers = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
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
                    print("change to group");
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
                    print("change to group");
                  },
                ),
              ],
            ),
          if (!isGroup)
            ElevatedButton(
                onPressed: () {
                  print("Create group");
                },
                child: Text("Create group"))
          else
            SizedBox(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: selectedUsers.length,
                  itemBuilder: (context, index) {
                    final chatUserState = selectedUsers[index];
                    return Stack(
                      children: [
                        Column(
                          children: [CircleAvatar(), Text(chatUserState.name)],
                        ),
                        IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              print("Select user");
                            })
                      ],
                    );
                  }),
            ),
          Expanded(
              child: ListView.builder(
            itemCount: 10,
            itemBuilder: (contex, index) {
              return ListTile(
                onTap: () {
                  print("selected User");
                },
                leading: CircleAvatar(),
                title: Text("user $index"),
                trailing: isGroup
                    ? Checkbox(
                        value: false,
                        onChanged: (value) {
                          print("select user to group");
                        })
                    : null,
              );
            },
          ))
        ],
      )),
    );
  }
}
