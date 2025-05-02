import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/Core/services/Shared_preference.dart';
import 'package:fruits_hub/Core/utils/constants.dart';
import 'package:fruits_hub/Core/utils/styles.dart';
import 'package:fruits_hub/Features/auth/presentation/views/login_view.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.title,

    required this.backgroundImage,
    required this.subTitle,
    required this.image,
    this.isSkipVisible = true,
  });
  final Widget title;
  final String image;
  final String backgroundImage;
  final String subTitle;
  final bool isSkipVisible;
  @override
  Widget build(BuildContext context) {
    return PageView(
      clipBehavior: Clip.none,
      children: [
        Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: -30,
              child: SvgPicture.asset(
                width: MediaQuery.of(context).size.width,
                backgroundImage,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(image, height: 300),
                  SizedBox(height: 64),
                  title,
                  SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      textAlign: TextAlign.center,
                      subTitle,
                      style: Styles.semiBold13.copyWith(
                        color: Color(0xff4E5556),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Visibility(
              visible: isSkipVisible,
              child: Positioned(
                right: 30,
                top: 50,
                child: GestureDetector(
                  onTap: () {
                    SharedPreferenceHelper.setBool(isOnBoardingSeen, true);
                    Navigator.pushNamed(context, LoginView.routeName);
                  },
                  child: Text(
                    'تخط',
                    style: Styles.regular13.copyWith(color: Color(0xff949D9E)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
