import 'package:chat_app/navigator_utils.dart';
import 'package:chat_app/ui/sign_in/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = StreamChat.of(context).client.state.user;
    final image = user?.extraData['image'];
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            if (image != null) Image.network(image) else Placeholder(),
            Switch(value: false, onChanged: (value) {}),
            ElevatedButton(
                onPressed: () {
                  popAllAndPush(context, SignInView());
                },
                child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}
