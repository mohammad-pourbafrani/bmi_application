import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bmi_application/controllers/main_controller.dart';
import 'package:bmi_application/utils/appcolors.dart';
import 'package:bmi_application/views/chart_screen.dart';
import 'package:bmi_application/views/homescreen.dart';
import 'package:bmi_application/views/list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  MainController mainController = Get.put(MainController());
  // RxBool test = false.obs;
  final List locale = [
    {'name': 'ENGLISH', 'locale': const Locale('en', 'US')},
    {'name': 'فارسی', 'locale': const Locale('fa', 'IR')},
  ];

  @override
  Widget build(BuildContext context) {
    bool typeTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    SystemChrome.setSystemUIOverlayStyle(
      typeTheme
          ? const SystemUiOverlayStyle(
              statusBarColor: AppColors.appBarDarkColor,
              systemNavigationBarColor: AppColors.primeryDarkColor,
            )
          : const SystemUiOverlayStyle(
              statusBarColor: AppColors.scaffoldLightColor,
              systemNavigationBarColor: AppColors.primeryLightColor,
            ),
    );
    return SafeArea(
      child: GetBuilder(
        init: MainController(),
        builder: (MainController mainController) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'textHeaderHomescreen'.tr,
                style: Get.textTheme.headline4!.apply(
                    color: typeTheme ? AppColors.white : AppColors.black),
              ),
              actions: [
                PopupMenuButton<int>(
                  color: typeTheme
                      ? AppColors.appBarDarkColor
                      : const Color.fromARGB(255, 204, 204, 204),
                  icon: Icon(
                    Icons.menu,
                    color: typeTheme ? AppColors.white : AppColors.black,
                    size: 32,
                  ),
                  offset: Offset(0, Get.height / 12),
                  elevation: 2,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Row(
                        children: [
                          Icon(
                            Icons.g_translate_rounded,
                            color:
                                typeTheme ? AppColors.white : AppColors.black,
                            size: 24,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'change_lanquage'.tr,
                            style: Get.textTheme.headline1!.apply(
                                color: typeTheme
                                    ? AppColors.white
                                    : AppColors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                  onSelected: (value) {
                    if (value == 1) {
                      changeLanguageAlertDialog(context, typeTheme);
                    }
                  },
                )
              ],
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
              backgroundColor: typeTheme
                  ? AppColors.floatActionDarkColor
                  : AppColors.floatActionLightColor,
              child: Text(
                'bmi'.tr,
                style: Get.textTheme.headline2!.apply(
                    color: typeTheme ? AppColors.black : AppColors.white),
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
                          color: typeTheme
                              ? AppColors.appBarDarkColor
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
                                "${mainController.bmi.toStringAsFixed(2)} ${'kg'.tr}",
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
                                            color: typeTheme
                                                ? AppColors.appBarDarkColor
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
                                                        colorText: typeTheme
                                                            ? AppColors
                                                                .textDarkColor
                                                            : AppColors
                                                                .textLightColor,
                                                        barBlur: 5,
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
                backgroundColor: typeTheme
                    ? AppColors.primeryDarkColor
                    : AppColors.primeryLightColor,
                icons: const [
                  Icons.ssid_chart_rounded,
                  CupertinoIcons.line_horizontal_3_decrease,
                ],
                gapLocation: GapLocation.center,
                activeColor: typeTheme ? AppColors.black : AppColors.white,
                inactiveColor: typeTheme ? AppColors.black : AppColors.white,
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

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);

    mainController.saveLanquage(
        country: locale.countryCode, lanquage: locale.languageCode);
  }

  changeLanguageAlertDialog(BuildContext context, bool typeTheme) {
    // set up the button
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor:
          typeTheme ? AppColors.appBarDarkColor : AppColors.scaffoldLightColor,
      title: Text(
        'change_lanquage'.tr,
        style: Get.textTheme.headline1!.apply(
          color: typeTheme ? AppColors.textDarkColor : AppColors.textLightColor,
        ),
      ),
      content: Container(
          width: double.maxFinite,
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Text(
                      locale[index]['name'],
                      style: Get.textTheme.headline1!.apply(
                        color: typeTheme
                            ? AppColors.textDarkColor
                            : AppColors.textLightColor,
                      ),
                    ),
                    onTap: () {
                      updateLanguage(locale[index]['locale']);
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: typeTheme
                      ? AppColors.primeryDarkColor
                      : AppColors.primeryLightColor,
                );
              },
              itemCount: locale.length)),
    ); // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
