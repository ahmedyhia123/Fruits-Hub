import 'package:flutter/material.dart';
import 'package:fruits_hub/Core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          backgroundColor: const Color(0xff1B5E37),
        ),
        onPressed: onPressed,
        child: Text(text, style: Styles.bold19.copyWith(color: Colors.white)),
      ),
    );
  }
}
