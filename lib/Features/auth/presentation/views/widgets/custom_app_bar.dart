import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/Core/utils/app_images.dart';
import 'package:fruits_hub/Core/utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(16),
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffF1F1F5)),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(Assets.assetsImagesBackIcon),
            ),
          ),
        ),
        Spacer(),
        Text(text, style: Styles.bold19),
        Spacer(),
        SizedBox(width: 16 + 55),
      ],
    );
  }
}
