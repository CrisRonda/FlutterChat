import 'package:chat_app/ui/app_theme_cubit.dart';
import 'package:chat_app/ui/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _streamChatClient = StreamChatClient("rgfsjzuawtnv");
  void connectFakeUser() async {
    await _streamChatClient.disconnect();
    await _streamChatClient
        .connectUser(
            User(
              id: "initgrammers",
            ),
            _streamChatClient.devToken("initgrammers"))
        .catchError((err) {
      print(err);
    });
    print("Conectando....");
  }

  @override
  Widget build(BuildContext context) {
    connectFakeUser();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return BlocProvider(
      create: (_) => AppThemeCubit()..init(),
      child: BlocBuilder<AppThemeCubit, bool>(builder: (context, snapshot) {
        print({snapshot});
        return MaterialApp(
          title: 'Flutter Chat',
          theme: snapshot ? ThemeData.dark() : ThemeData.light(),
          home: SplashView(),
          builder: (context, child) {
            return StreamChat(client: _streamChatClient, child: child);
          },
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}
