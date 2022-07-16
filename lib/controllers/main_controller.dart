import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  //variables

  var size = Get.size;
  var bottomNavIndex = 2.obs;

  var floatingActionButtonLocation = FloatingActionButtonLocation.centerDocked;

  //lists

  //other controller

  //function
  void changeLocationFloatAction(int val) {
    floatingActionButtonLocation = val != 2
        ? FloatingActionButtonLocation.miniEndFloat
        : FloatingActionButtonLocation.centerDocked;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
