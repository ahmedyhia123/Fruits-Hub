import 'package:flutter/material.dart';
import 'package:fruits_hub/Core/widgets/search_text_field.dart';
import 'package:fruits_hub/Core/widgets/sliver_sized_box.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/custom_home_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: CustomHomeAppBar()),
        SliverSizedBox(height: 24),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SearchTextField(),
          ),
        ),
      ],
    );
  }
}
