import 'package:flutter/material.dart';
import 'package:fruits_hub/Core/utils/app_images.dart';
import 'package:fruits_hub/Core/utils/styles.dart';
import 'package:fruits_hub/Features/onBoarding/presentation/views/widgets/page_view_item.dart';

class CustomOnboardingPageView extends StatelessWidget {
  const CustomOnboardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(style: Styles.bold23, ' مرحبًا بك في '),
              Text(
                'HUB',
                style: Styles.bold23.copyWith(color: Color(0xffF4A91F)),
              ),
              Text(
                'Fruit',
                style: Styles.bold23.copyWith(color: Color(0xff1B5E37)),
              ),
            ],
          ),
          backgroundImage: Assets.assetsImagesOnboardingBack1,
          subTitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB .استكشف \n مجموعتنا الواسعة من الفواكه الطازجة الممتازة\n واحصل على أفضل العروض والجودة العالية.',
          image: Assets.assetsImagesOnboarding1,
        ),
        PageViewItem(
          isSkipVisible: false,
          title: const Text(style: Styles.bold23, ' ابحث وتسوق'),
          backgroundImage: Assets.assetsImagesOnboardingBack2,
          subTitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل  والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          image: Assets.assetsImagesOnboarding2,
        ),
      ],
    );
  }
}
