import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnBoradingImage extends StatelessWidget {
  const OnBoradingImage({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        imagePath,
        width: 450.w,
        height: 200.h,
      ),
    );
  }
}
