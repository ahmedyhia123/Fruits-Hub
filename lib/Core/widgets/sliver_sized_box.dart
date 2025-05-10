import 'package:flutter/widgets.dart';

class SliverSizedBox extends StatelessWidget {
  const SliverSizedBox({super.key, this.height = 0, this.weight = 0});
  final double height;
  final double weight;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: SizedBox(height: height, width: weight));
  }
}