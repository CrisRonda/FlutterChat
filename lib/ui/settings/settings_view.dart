import 'package:chat_app/navigator_utils.dart';
import 'package:chat_app/ui/app_theme_cubit.dart';
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
        body: Center(
          child: Column(
            children: [
              if (image != null) Image.network(image) else Placeholder(),
              BlocBuilder<SettingsSwitchCubit, bool>(
                  builder: (context, isDark) {
                return Switch(
                    value: isDark,
                    onChanged: (value) {
                      context.read<SettingsSwitchCubit>().onChangeTheme(value);
                      context.read<AppThemeCubit>().updateDarkMode(value);
                    });
              }),
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
    );
  }
}
