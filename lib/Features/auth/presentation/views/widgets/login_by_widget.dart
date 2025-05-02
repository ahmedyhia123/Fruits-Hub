import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/Core/utils/styles.dart';

class LoginByWidget extends StatelessWidget {
  const LoginByWidget({
    super.key,
    required this.text,
    required this.logo,
    this.onTap,
  });
  final String text;
  final String logo;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: Color(0xffDDDFDF)),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: ListTile(
          leading: SvgPicture.asset(logo, height: 24),
          title: Text(textAlign: TextAlign.center, text, style: Styles.bold16),
        ),
      ),
    );
  }
}
