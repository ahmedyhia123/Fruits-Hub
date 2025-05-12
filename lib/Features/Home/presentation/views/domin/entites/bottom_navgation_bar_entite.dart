import 'package:fruits_hub/Core/utils/app_images.dart';

class BottomNavgationBarEntite {
  final String activeItem;
  final String inActiveItem;
  final String name;
  BottomNavgationBarEntite({
    required this.activeItem,
    required this.inActiveItem,
    required this.name,
  });
}

List<BottomNavgationBarEntite> bottomNavgationBarEntites = [
  BottomNavgationBarEntite(
    inActiveItem: Assets.assetsImagesHomeBnb,
    activeItem: Assets.assetsImagesHomeBnbBold,
    name: 'الرئيسية',
  ),
  BottomNavgationBarEntite(
    inActiveItem: Assets.assetsImagesProuctsBnb,
    activeItem: Assets.assetsImagesProuctsBnbBold,
    name: 'المنتجات',
  ),
  BottomNavgationBarEntite(
    inActiveItem: Assets.assetsImagesCartBnb,
    activeItem: Assets.assetsImagesCartBnbBold,
    name: 'Cart',
  ),
  BottomNavgationBarEntite(
    inActiveItem: Assets.assetsImagesUserBnb,
    activeItem: Assets.assetsImagesUserBnbBold,
    name: 'حسابي',
  ),
];
