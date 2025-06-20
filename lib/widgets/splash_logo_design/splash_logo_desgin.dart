import 'package:flutter/cupertino.dart';

class SplashLogoDesign extends StatelessWidget {
  const SplashLogoDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset("assets/images/logo.jpg", height: 150, width: 180),
    );
  }
}
