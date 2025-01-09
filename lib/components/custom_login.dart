import 'package:flutter/material.dart';

class Customlogin extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final String? imagePath;
  final double? imageSize;

  const Customlogin({
    Key? key,
    required this.onPressed,
    this.backgroundColor,
    this.imagePath,
    this.imageSize = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.grey,
          padding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Image.asset(
          imagePath ?? '',
          width: imageSize,
          height: imageSize,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
