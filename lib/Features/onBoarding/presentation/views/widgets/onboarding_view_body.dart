import 'package:flutter/material.dart';
import 'package:fruits_hub/Core/services/Shared_preference.dart';
import 'package:fruits_hub/Core/utils/constants.dart';
import 'package:fruits_hub/Core/widgets/custom_button.dart';
import 'package:fruits_hub/Features/auth/presentation/views/login_view.dart';
import 'package:fruits_hub/Features/onBoarding/presentation/views/widgets/custom_onboarding_page_view.dart';
import 'package:dots_indicator/dots_indicator.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController pageController;
  var currentPage = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomOnboardingPageView(pageController: pageController),
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: Color(0xff1B5E37),
            activeSize: Size(11, 11),
            size: currentPage == 1 ? Size(11, 11) : Size(9, 9),
            color:
                currentPage == 1
                    ? Color(0xff1B5E37)
                    : Color(0xff5DB957).withOpacity(0.5),
          ),
        ),
        const SizedBox(height: 32),
        currentPage == 1
            ? Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding,
              ),
              child: CustomButton(
                text: 'ابدأ الان',
                onPressed: () {
                  SharedPreferenceHelper.setBool(isOnBoardingSeen, true);
                  Navigator.pushNamed(context, LoginView.routeName);
                },
              ),
            )
            : SizedBox(height: 55),
        const SizedBox(height: 45),
      ],
    );
  }
}
