import 'package:get/get.dart';

class Items {
  String img;
  String title;
  String subtitle;

  Items({
    required this.img,
    required this.title,
    required this.subtitle,
  });
}

List<Items> summeryItems = [
  Items(
      img: 'assets/images/1.png', title: "title1".tr, subtitle: 'subtitle1'.tr),
  Items(
      img: 'assets/images/2.png', title: 'title2'.tr, subtitle: 'subtitle2'.tr),
  Items(
      img: 'assets/images/3.png', title: 'title3'.tr, subtitle: 'subtitle3'.tr),
];
