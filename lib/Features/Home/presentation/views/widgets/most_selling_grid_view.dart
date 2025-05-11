import 'package:flutter/material.dart';
import 'package:fruits_hub/Core/widgets/fruit_item.dart';

class MostSellingGridView extends StatelessWidget {
  const MostSellingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 185,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        
        
      ),
      itemBuilder: (context, index) => const FruitItem(),
    );
  }
}
