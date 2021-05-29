import 'package:flutter/material.dart';

class AvatarImageView extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const AvatarImageView({Key key, this.onTap, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(30)),
              height: 200,
              width: 200,
              child: child,
            ),
            Positioned(
                bottom: -15,
                right: 0,
                child: GestureDetector(
                    onTap: onTap,
                    child: CircleAvatar(child: Icon(Icons.camera))))
          ],
        ),
      ),
    );
  }
}
