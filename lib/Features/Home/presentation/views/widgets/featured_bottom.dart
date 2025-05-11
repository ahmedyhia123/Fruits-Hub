import 'package:flutter/material.dart';
import 'package:fruits_hub/Core/utils/styles.dart';

class FeaturedBottom extends StatelessWidget {
  const FeaturedBottom({super.key, required this.text, this.onPressed});
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          backgroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: FittedBox(
            child: Text(
              text,
              style: Styles.bold13.copyWith(color: const Color(0xff1B5E37)),
            ),
          ),
        ),
      ),
    );
  }
}
