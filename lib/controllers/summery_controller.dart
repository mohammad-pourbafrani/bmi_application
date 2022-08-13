import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SummeryController extends GetxController {
  //variables
  // var size = Get.mediaQuery.size;این حتما سوال بشه؟
  var size = Get.size;
  var curentIndex = 0.obs;
  //lists

  //other controller
  PageController pageController = PageController(initialPage: 0);

}
