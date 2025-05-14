import 'package:flutter/material.dart';
import 'package:fruits_hub/Core/utils/styles.dart';
import 'package:fruits_hub/Features/best_selling_fruits/presentation/views/best_selling_view.dart';

class MostSelling extends StatelessWidget {
  const MostSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Navigator.pushNamed(context, BestSellingView.routeName),
      child: Row(
        children: [
          const Text('الأكثر مبيعًا', style: Styles.bold19),
          const Spacer(),
          Text(
            'المزيد',
            style: Styles.semiBold16.copyWith(color: const Color(0xff949D9E)),
          ),
        ],
      ),
    );
  }
}
