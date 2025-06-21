import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashLogoDesign extends StatelessWidget {
  const SplashLogoDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset("assets/images/logo.jpg", height: 150.h, width: 180.w),
    );
  }
}
