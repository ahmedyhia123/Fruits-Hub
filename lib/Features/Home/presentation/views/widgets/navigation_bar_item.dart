import 'package:flutter/material.dart';
import 'package:fruits_hub/Features/Home/presentation/views/domin/entites/bottom_navgation_bar_entite.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/active_item.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/inactive_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isActive,
    required this.icon,
  });
  final bool isActive;
  final BottomNavgationBarEntite icon;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveItem(iconPath: icon.activeItem)
        : InActiveItem(iconPath: icon.inActiveItem);
  }
}
