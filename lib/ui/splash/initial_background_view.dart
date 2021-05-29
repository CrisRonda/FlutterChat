import 'package:flutter/material.dart';

class InitialBackgroundView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Positioned(
        //     height: 150,
        //     top: 1,
        //     right: 0,
        //     child: Image.asset('assets/image1.png')),
        // Positioned(
        //     height: 150,
        //     bottom: -10,
        //     left: 0,
        //     child: Image.asset('assets/image2.png'))
      ],
    );
  }
}
