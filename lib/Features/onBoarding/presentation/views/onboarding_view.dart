import 'package:flutter/material.dart';
import 'package:fruits_hub/Features/onBoarding/presentation/views/widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
  static const String routeName = 'onboarding';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: OnboardingViewBody());
  }
}
