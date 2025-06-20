// lib/view/widgets/background_design.dart

import 'package:flutter/material.dart';

class BackgroundDesign extends StatelessWidget {
  const BackgroundDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:  [
        Positioned(
          top: 50,
          right: 130,
          child: Image.asset("assets/images/image1.png", width: 80),
        ),
        Positioned(
          top: 170,
          child: Image.asset("assets/images/image4.png", width: 80),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset("assets/images/image3.png", width: 90),
        ),
        Positioned(
          top: 390,
          right: -5,
          child: Image.asset("assets/images/image5.png", width: 60),
        ),
        Positioned(
          top: 195,
          right: -10,
          child: Image.asset("assets/images/image1.png", width: 120),
        ),
        Positioned(
          bottom: 190,
          left: -60,
          child: Image.asset("assets/images/image1.png", width: 110),
        ),
        Positioned(
          bottom: 0,
          child: Image.asset("assets/images/image2.png", width: 110),
        ),
        Positioned(
          bottom: 180,
          left: 100,
          child: Image.asset("assets/images/image6.png", width: 130),
        ),
      ],
    );
  }
}
