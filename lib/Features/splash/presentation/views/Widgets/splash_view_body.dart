import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/Core/services/shared_preference.dart';
import 'package:fruits_hub/Core/utils/app_images.dart';
import 'package:fruits_hub/Core/utils/constants.dart';
import 'package:fruits_hub/Features/auth/presentation/views/login_view.dart';
import 'package:fruits_hub/Features/onBoarding/presentation/views/onboarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNavigation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [SvgPicture.asset(Assets.assetsImagesPlant)],
        ),
        SvgPicture.asset(Assets.assetsImagesLogo),
        SvgPicture.asset(Assets.assetsImagesCircles, fit: BoxFit.cover),
      ],
    );
  }

  void excuteNavigation() {
    Future.delayed(const Duration(seconds: 3), () {
      if (SharedPreferenceHelper.getBool(isOnBoardingSeen)) {
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, OnboardingView.routeName);
      }
    });
  }
}
