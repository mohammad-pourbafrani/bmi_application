import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bmi_application/controllers/main_controller.dart';
import 'package:bmi_application/utils/appcolors.dart';
import 'package:bmi_application/views/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  // MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder(
        init: MainController(),
        builder: (MainController mainController) {
          return Scaffold(
            body: Stack(
              children: [
                SizedBox(
                  width: mainController.size.width,
                  height: mainController.size.height,
                  child: IndexedStack(
                    children: [HomeScreen()],
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.floatActionLightColor,
              child: Text(
                'bmi'.tr,
                style: Get.textTheme.headline2!.apply(color: Colors.white),
              ),
              onPressed: () {
                mainController.changeLocationFloatAction(2);
              },
            ),
            floatingActionButtonLocation:
                mainController.floatingActionButtonLocation,
            bottomNavigationBar: AnimatedBottomNavigationBar(
                backgroundColor: AppColors.primeryLightColor,
                icons: const [
                  Icons.ssid_chart_rounded,
                  CupertinoIcons.line_horizontal_3_decrease,
                ],
                gapLocation: GapLocation.center,
                activeColor: AppColors.activeIconNavBarLightColor,
                inactiveColor: AppColors.activeIconNavBarLightColor,
                iconSize: 32,
                height: mainController.size.height / 12.5,
                notchSmoothness: NotchSmoothness.softEdge,
                leftCornerRadius: 24,
                rightCornerRadius: 24,
                activeIndex: mainController.bottomNavIndex.value,
                onTap: (index) {
                  mainController.bottomNavIndex.value = index;
                  mainController.changeLocationFloatAction(index);
                }),
          );
        },
      ),
    );
  }
}
