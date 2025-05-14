
import 'package:flutter/material.dart';
import 'package:fruits_hub/Features/Home/presentation/views/domin/entites/bottom_navgation_bar_entite.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
   int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
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
          (index) => GestureDetector(
            onTap: () {
              currentIndex = index;
              setState(() {
                
              });
              
            },
            child: NavigationBarItem(
              isActive: currentIndex == index,
              icon: bottomNavgationBarEntites[index],
            ),
          ),
        ),
      ),
    );
  }
}
