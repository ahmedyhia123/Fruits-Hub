import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/Core/utils/app_images.dart';
import 'package:fruits_hub/Core/utils/styles.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/featured_bottom.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    final itemWidth = MediaQuery.of(context).size.width -32;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        
        width: itemWidth,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: itemWidth *.36,
                child: SvgPicture.asset(
                  fit: BoxFit.fill,
                  Assets.assetsImagesOnboarding2)),
              Container(
                width: itemWidth / 2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: svg.Svg(Assets.assetsImagesShapGreean),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Text(
                        
                        'عروض العيد',
                        style: Styles.regular16.copyWith(color: Colors.white.withValues(
                          alpha: 0.8
                        )),
                      ),
                  
                      const SizedBox(height: 15),
                      Text(
                        
                        'خصم 25%',
                        style: Styles.bold23.copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 15),
                      const FeaturedBottom(text: 'تسوق الان'),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
