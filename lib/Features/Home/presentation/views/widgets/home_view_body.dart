import 'package:flutter/material.dart';
import 'package:fruits_hub/Core/widgets/fruit_item.dart';
import 'package:fruits_hub/Core/widgets/search_text_field.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/featured_list.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/most_selling.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomHomeAppBar(),
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SearchTextField(),
              ),
              SizedBox(height: 12),
              FeaturedList(),
              SizedBox(height: 12),
              MostSelling(),
              SizedBox(height: 8),
              FruitItem(),
            ],
          ),
        ),
      ],
    );
  }
}


