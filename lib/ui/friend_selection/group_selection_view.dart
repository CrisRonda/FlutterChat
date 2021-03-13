import 'package:flutter/material.dart';

class GroupSelectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Verify your identity"),
            Placeholder(
              fallbackHeight: 111,
              fallbackWidth: 111,
            ),
            IconButton(icon: Icon(Icons.photo), onPressed: () {}),
            TextField(
              decoration: InputDecoration(hintText: "Name group"),
            ),
            Wrap(
              children: List.generate(
                  5,
                  (index) => Column(
                        children: [CircleAvatar(), Text('index $index')],
                      )),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Next"))
          ],
        ),
      ),
    );
  }
}
