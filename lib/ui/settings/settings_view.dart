import 'package:chat_app/navigator_utils.dart';
import 'package:chat_app/ui/app_theme_cubit.dart';
import 'package:chat_app/ui/common/avatar_image/avatar_image_view.dart';
import 'package:chat_app/ui/settings/settings_cubit.dart';
import 'package:chat_app/ui/sign_in/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = StreamChat.of(context).client.state.user;
    final image = user?.extraData['image'];
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) =>
                SettingsSwitchCubit(context.read<AppThemeCubit>().isDarkMode)),
        BlocProvider(create: (context) => SettingsLogoutCubit(context.read())),
      ],
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              children: [
                if (image != null)
                  AvatarImageView(
                      child: image != null
                          ? Image.network(
                              image,
                              height: 150,
                            )
                          : Icon(
                              Icons.person_outline,
                              size: 100,
                              color: Colors.grey[400],
                            ),
                      onTap: () => {}),
                Text(
                  user.name,
                  style: Theme.of(context).textTheme.headline1.merge(TextStyle(
                      color: Theme.of(context).appBarTheme.foregroundColor,
                      fontWeight: FontWeight.w600)),
                ),
                SizedBox(
                  width: 16,
                ),
                Row(
                  children: [
                    Icon(Icons.night_shelter_outlined),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Dark mode",
                      style: TextStyle(
                          color: Theme.of(context).appBarTheme.foregroundColor),
                    ),
                    Spacer(),
                    BlocBuilder<SettingsSwitchCubit, bool>(
                        builder: (context, isDark) {
                      return Switch(
                          value: isDark,
                          onChanged: (value) {
                            context
                                .read<SettingsSwitchCubit>()
                                .onChangeTheme(value);
                            context.read<AppThemeCubit>().updateDarkMode(value);
                          });
                    }),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Builder(
                    builder: (context) => GestureDetector(
                          onTap: () =>
                              context.read<SettingsLogoutCubit>().logout(),
                          child: BlocListener<SettingsLogoutCubit, void>(
                            listener: (context, snap) {
                              popAllAndPush(context, SignInView());
                            },
                            child: Row(children: [
                              Icon(Icons.logout),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                "Logout",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .appBarTheme
                                        .foregroundColor),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_right_rounded),
                            ]),
                          ),
                        )),
                Builder(
                  builder: (context) => BlocListener<SettingsLogoutCubit, void>(
                    listener: (context, snap) {
                      popAllAndPush(context, SignInView());
                    },
                    child: ElevatedButton(
                        onPressed: () {
                          context.read<SettingsLogoutCubit>().logout();
                        },
                        child: Text("Logout")),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
