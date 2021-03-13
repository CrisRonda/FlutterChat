import 'package:chat_app/navigator_utils.dart';
import 'package:chat_app/ui/chat/chat_view.dart';
import 'package:chat_app/ui/friend_selection/friend_selection_view.dart';
import 'package:chat_app/ui/home/home_cubit.dart';
import 'package:chat_app/ui/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: BlocBuilder<HomeCubit, int>(
        builder: (context, index) {
          return Column(
            children: [
              Expanded(
                child: IndexedStack(
                  index: index,
                  children: [ChatView(), SettingsView()],
                ),
              ),
              HomeNavigationBar(),
            ],
          );
        },
      ),
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
            ElevatedButton(
                onPressed: () {
                  context.read<HomeCubit>().onChangeIndex(0);
                },
                child: Text("Chats")),
            FloatingActionButton(
              onPressed: () {
                pushToPage(context, FrinedSelectionView());
              },
              child: Icon(Icons.add),
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<HomeCubit>().onChangeIndex(1);
                },
                child: Text("Settings"))
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
