// import 'package:chat_app/ui/profile_verify/profile_verify_view.dart';
import 'package:chat_app/ui/sign_in/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/navigator_utils.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  pushAndReplacePage(context, SignInView());
                  // pushAndReplacePage(context, ProfileVerifiyView());
                },
                child: Text("Next"))
          ],
        ),
      ),
    );
  }
}
