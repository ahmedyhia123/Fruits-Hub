import 'package:flutter/material.dart';
import 'package:fruits_hub/Features/auth/presentation/views/login_view.dart';
import 'package:fruits_hub/Features/auth/presentation/views/signup_view.dart';
import 'package:fruits_hub/Features/onBoarding/presentation/views/onboarding_view.dart';
import 'package:fruits_hub/Features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnboardingView());

    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());

    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());

    default:
      return MaterialPageRoute(
        builder:
            (context) =>
                const Scaffold(body: Center(child: Text('No route found'))),
      );
  }
}
