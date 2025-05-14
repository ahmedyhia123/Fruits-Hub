import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/Core/utils/app_images.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 32,
      backgroundColor:const Color(0xffEEF8ED),
      child: SvgPicture.asset(
        height: 30,
        Assets.assetsImagesNotificationIcon),
    );
  }
}