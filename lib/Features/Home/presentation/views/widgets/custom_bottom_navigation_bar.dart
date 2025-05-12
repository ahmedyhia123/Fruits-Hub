import 'package:flutter/material.dart';
import 'package:fruits_hub/Features/Home/presentation/views/domin/entites/bottom_navgation_bar_entite.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = 1;
    return Container(
      height: 70,
      width: 375,

      decoration: const ShapeDecoration(
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
          ),
        ],
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          bottomNavgationBarEntites.length,
          (index) => NavigationBarItem(
            isActive: currentIndex == index,
            icon: bottomNavgationBarEntites[index],
          ),
        ),
      ),
    );
  }
}





