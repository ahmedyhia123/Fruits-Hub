import 'package:flutter/material.dart';
import 'package:fruits_hub/Core/utils/styles.dart';
import 'package:fruits_hub/Core/widgets/notification_widget.dart';

AppBar customBestSellingAppBar(context, {required String title}) {
  return AppBar(
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.transparent,
          shape: CircleBorder(
            side: BorderSide(color: Colors.black.withValues(alpha: .5)),
          ),
        ),

        child: const Center(
          child: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: NotificationWidget(),
      ),
    ],
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(title, style: Styles.bold19.copyWith(color: Colors.black)),
  );
}
