import 'package:chat_app/ui/profile_verify/profile_verify_view.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/navigator_utils.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to Chat"),
            ElevatedButton(
                onPressed: () {
                  pushAndReplacePage(context, ProfileVerifiyView());
                },
                child: Text("Login with Google"))
          ],
        ),
      ),
    );
  }
}
