import 'package:flutter/material.dart';
import 'package:fruits_hub/Core/utils/app_images.dart';
import 'package:fruits_hub/Core/utils/styles.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xffF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            // top: 8,
            // right: 8,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_outlined),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const Spacer(),
                Image.asset(Assets.assetsImagesWatermelon),
                const Spacer(),
                ListTile(
                  trailing: const CircleAvatar(
                    backgroundColor: Color(0xff1B5E37),
                    child: Icon(Icons.add, color: Colors.white, size: 28),
                  ),
                  title: const Text('بطيخ', style: Styles.semiBold16),
                  subtitle: FittedBox(
                    child: Row(
                      children: [
                        Text(
                          '20جنية ',
                          style: Styles.bold13.copyWith(
                            color: const Color(0xffF4A91F),
                          ),
                        ),
                        Text(
                          '/ الكيلو',
                          style: Styles.bold13.copyWith(
                            color: const Color(
                              0xffF4A91F,
                            ).withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
