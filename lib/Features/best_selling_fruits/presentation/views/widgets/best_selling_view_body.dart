import 'package:flutter/material.dart';
import 'package:fruits_hub/Core/widgets/sliver_sized_box.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/most_selling_grid_view.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [SliverSizedBox(height: 16), MostSellingGridView()],
    );
  }
}
