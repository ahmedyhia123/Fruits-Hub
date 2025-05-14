import 'package:flutter/material.dart';
import 'package:fruits_hub/Core/widgets/custom_best_selling_app_bar.dart';
import 'package:fruits_hub/Features/best_selling_fruits/presentation/views/widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const String routeName = 'best-selling-fruits';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customBestSellingAppBar(context , title: 'الأكثر مبيعًا'),
      body: const SafeArea(child: BestSellingViewBody()),
    );
  }
}
