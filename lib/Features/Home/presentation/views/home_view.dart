import 'package:flutter/material.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SafeArea(child: HomeViewBody()));
  }
}
