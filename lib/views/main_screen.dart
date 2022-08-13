import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bmi_application/controllers/main_controller.dart';
import 'package:bmi_application/utils/appcolors.dart';
import 'package:bmi_application/views/chart_screen.dart';
import 'package:bmi_application/views/homescreen.dart';
import 'package:bmi_application/views/list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  // MainController mainController = Get.put(MainController());
  // RxBool test = false.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder(
        init: MainController(),
        builder: (MainController mainController) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.scaffoldLightColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'textHeaderHomescreen'.tr,
                    style: Get.textTheme.headline4!.apply(color: Colors.black),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu_rounded,
                        color: Colors.black,
                        size: 32,
                      ))
                ],
              ),
            ),
            body: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: mainController.size.width,
                      height: mainController.size.height / 10 * 8,
                      child: IndexedStack(
                        index: mainController.bottomNavIndex.value,
                        children: [ChartScreen(), ListScreen(), HomeScreen()],
                      ),
                    ),
                  ],
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
                if (mainController.bottomNavIndex.value != 2) {
                  mainController.bottomNavIndex.value = 2;
                  mainController.changeLocationFloatAction(2);
                } else {
                  mainController.getBmi();
                  Get.bottomSheet(
                    isDismissible: false,
                    enableDrag: false,
                    Container(
                      width: mainController.size.width,
                      height: mainController.size.height / 1.5,
                      decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? AppColors.primeryLightColor
                              : AppColors.primeryLightColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                'yourbmi'.tr,
                                style: Get.textTheme.subtitle1!
                                    .apply(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${mainController.bmi.toStringAsFixed(2)} kg/m2",
                                style: Get.textTheme.headline4!
                                    .apply(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "(${mainController.status})",
                                style: Get.textTheme.headline2!
                                    .apply(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                mainController.textBmi,
                                style: Get.textTheme.headline2!
                                    .apply(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Get.back();
                                      Get.bottomSheet(
                                        // isDismissible: false,
                                        // enableDrag: false,
                                        Container(
                                          width: mainController.size.width,
                                          height:
                                              mainController.size.height / 2.5,
                                          decoration: BoxDecoration(
                                            color: Get.isDarkMode
                                                ? AppColors.primeryLightColor
                                                : AppColors.primeryLightColor,
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(24),
                                              topRight: Radius.circular(24),
                                            ),
                                          ),
                                          child: Obx(
                                            () => Column(
                                              children: [
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'save'.tr,
                                                      style: Get
                                                          .textTheme.subtitle2!
                                                          .apply(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Checkbox(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      checkColor: Colors.black,
                                                      fillColor:
                                                          MaterialStateProperty
                                                              .resolveWith<
                                                                      Color>(
                                                                  (states) {
                                                        if (states.contains(
                                                            MaterialState
                                                                .selected)) {
                                                          return Colors.white;
                                                        }

                                                        return Colors.white;
                                                      }),
                                                      value: mainController
                                                          .checkBoxSave.value,
                                                      onChanged: (check) {
                                                        mainController
                                                            .checkBoxSave
                                                            .value = check!;
                                                      },
                                                    )
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: TextField(
                                                    controller: mainController
                                                        .addNameController,
                                                    enabled: !mainController
                                                        .checkBoxSave.value,
                                                    style: Get
                                                        .textTheme.subtitle2!
                                                        .apply(
                                                      color: Colors.white,
                                                    ),
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'inter_other_name'.tr,
                                                      labelStyle: Get
                                                          .textTheme.bodyText1!
                                                          .apply(
                                                              color: Colors
                                                                  .white60),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    mainController.addInfo(
                                                        mainController
                                                            .createInfoUser());
                                                    Get.back();
                                                    Get.snackbar(
                                                        'save_snackbar'.tr,
                                                        'massage_save'.tr,
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    4000));
                                                  },
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .resolveWith(
                                                                  (states) {
                                                    return Colors.black;
                                                  })),
                                                  child: Text(
                                                    'btn_save'.tr,
                                                    style: Get
                                                        .textTheme.headline2!
                                                        .apply(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      CupertinoIcons.bookmark,
                                      color: Colors.white,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.share,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  width: 60,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.black,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'close'.tr,
                                      style: Get.textTheme.headline2!
                                          .apply(color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
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
