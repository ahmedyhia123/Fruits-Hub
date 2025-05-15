import 'package:flutter/material.dart';
import 'package:fruits_hub/Core/Helper/get_user.dart';
import 'package:fruits_hub/Core/utils/app_images.dart';
import 'package:fruits_hub/Core/utils/styles.dart';
import 'package:fruits_hub/Core/widgets/notification_widget.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      trailing: const NotificationWidget(),
      leading: Image.asset( Assets.assetsImagesUserImage),
      title: Text(
        'صباح الخير !..',
        style: Styles.regular16.copyWith(color: const Color(0xff949D9E)),
      ),
      subtitle:  Text(getUser().name, style: Styles.bold16),
    );
  }
}


