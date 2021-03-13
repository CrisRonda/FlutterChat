import 'package:chat_app/navigator_utils.dart';
import 'package:chat_app/ui/chat/chat_view.dart';
import 'package:chat_app/ui/friend_selection/friend_selection_view.dart';
import 'package:chat_app/ui/settings/settings_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: IndexedStack(
            children: [ChatView(), SettingsView()],
            index: 0,
          ),
        ),
        HomeNavigationBar(),
      ],
    );
  }
}

class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 100,
        child: Row(
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Chats")),
            FloatingActionButton(
              onPressed: () {
                pushToPage(context, FrinedSelectionView());
              },
              child: Icon(Icons.add),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Settings"))
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
