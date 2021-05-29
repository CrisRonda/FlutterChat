import 'package:chat_app/navigator_utils.dart';
import 'package:chat_app/ui/chat/chat_view.dart';
import 'package:chat_app/ui/common/custom_scaffold/custom_scaffold_view.dart';
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
                  children: [
                    CustomScaffold(
                      child: ChatView(),
                      title: "Chats",
                    ),
                    CustomScaffold(
                      child: SettingsView(),
                      title: "Settings",
                    )
                  ],
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
    final cubit = BlocProvider.of<HomeCubit>(context, listen: true);
    final width = MediaQuery.of(context).size.width * .7;
    final canvasColor = Theme.of(context).canvasColor;

    return Material(
      color: canvasColor,
      child: Container(
        height: 100,
        child: Stack(
          children: [
            Positioned(
                child: Center(
              child: Container(
                width: width,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: canvasColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _HomeNavigationItem(
                      icon: Icons.chat,
                      label: "Chats",
                      onTap: () => cubit.onChangeIndex(0),
                      selected: cubit.state == 0,
                    ),
                    _HomeNavigationItem(
                      icon: Icons.settings,
                      label: "Settings",
                      onTap: () {
                        cubit.onChangeIndex(1);
                      },
                      selected: cubit.state == 1,
                    ),
                  ],
                ),
              ),
            )),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration:
                    BoxDecoration(color: canvasColor, shape: BoxShape.circle),
                child: FloatingActionButton(
                  onPressed: () {
                    pushToPage(context, FrinedSelectionView());
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Item menu nav

class _HomeNavigationItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool selected;

  const _HomeNavigationItem(
      {Key key, this.icon, this.label, this.onTap, this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectColor =
        Theme.of(context).bottomNavigationBarTheme.selectedItemColor;

    final unselectColor =
        Theme.of(context).bottomNavigationBarTheme.unselectedItemColor;
    final color = selected ? selectColor : unselectColor;
    print(color);
    print(selected);
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
          ),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .caption
                .merge(TextStyle(color: color)),
          )
        ],
      ),
    );
  }
}
