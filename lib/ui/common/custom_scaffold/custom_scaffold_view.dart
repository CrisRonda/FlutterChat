import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;
  final String title;

  const CustomScaffold({Key key, this.child, this.title = 'Title here'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        centerTitle: false,
        elevation: 0,
      ),
    );
  }
}
