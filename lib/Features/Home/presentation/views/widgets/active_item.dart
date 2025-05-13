import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/Core/utils/styles.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.iconPath, required this.title});
  final String iconPath;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xffEEEEEE),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          Container(
            height: 40,
            width: 40,
            decoration: const ShapeDecoration(
              color: Color(0xff1B5E37),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
            ),
            child: Center(child: SvgPicture.asset(height: 20, iconPath)),
          ),
           const SizedBox(width: 8),
          Text(
            title,
            style: Styles.semiBold13.copyWith(color: const Color(0xff1B5E37)),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
