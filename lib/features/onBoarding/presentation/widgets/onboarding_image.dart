import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoradingImage extends StatelessWidget {
  const OnBoradingImage({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Center(
        child: SvgPicture.asset(
          imagePath,
        ),
      ),
    );
  }
}
