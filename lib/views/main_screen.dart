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
import 'package:share_plus/share_plus.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final MainController mainController = Get.put(MainController());
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
              statusBarBrightness: Brightness.light,
              systemNavigationBarIconBrightness: Brightness.light,
            )
          : const SystemUiOverlayStyle(
              statusBarColor: AppColors.scaffoldLightColor,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: AppColors.primeryLightColor,
              systemNavigationBarIconBrightness: Brightness.light,
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
                SizedBox(
                  width: mainController.size.width,
                  height: mainController.size.height / 10 * 8,
                  child: IndexedStack(
                    alignment: Alignment.center,
                    index: mainController.bottomNavIndex.value,
                    children: [ChartScreen(), ListScreen(), HomeScreen()],
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: typeTheme
                  ? AppColors.primeryDarkColor
                  : AppColors.primeryLightColor,
              child: ImageIcon(
                const AssetImage("assets/icons/bmi.png"),
                size: 24,
                color: typeTheme ? AppColors.black : AppColors.white,
              ),
              onPressed: () {
                if (mainController.bottomNavIndex.value != 2) {
                  mainController.bottomNavIndex.value = 2;
                  mainController.changeLocationFloatAction(2);
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
      content: SizedBox(
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
