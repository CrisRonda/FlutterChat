// import 'package:chat_app/navigator_utils.dart';
import 'package:chat_app/navigator_utils.dart';
import 'package:chat_app/ui/home/home_view.dart';
import 'package:flutter/material.dart';

class ProfileVerifiyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Verifiy your identity"),
          Placeholder(
            fallbackHeight: 100,
            fallbackWidth: 100,
          ),
          IconButton(icon: Icon(Icons.photo), onPressed: () {}),
          Text("Your name"),
          TextField(
            decoration: InputDecoration(hintText: "Or just how people now you"),
          ),
          ElevatedButton(
              onPressed: () {
                pushAndReplacePage(context, HomeView());
              },
              child: Text("Start chat now"))
        ],
      ),
    ));
  }
}
