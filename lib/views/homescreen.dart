import 'package:bmi_application/components.dart';
import 'package:bmi_application/controllers/main_controller.dart';
import 'package:bmi_application/utils/appcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    bool typeTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //gender
                Row(
                  children: [
                    Expanded(child: Obx((() {
                      return CustomiesCardInkwel(
                        color: typeTheme
                            ? AppColors.appBarDarkColor
                            : AppColors.scaffoldLightColor,
                        onTab: () {
                          mainController.gender.value = "male";
                        },
                        select: mainController.gender.value == "male"
                            ? true
                            : false,
                        chaild: SizedBox(
                          height: mainController.size.height / 8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/male.png',
                                height: mainController.size.height / 14,
                              ),
                              Text(
                                'male'.tr,
                                style: Get.textTheme.headline3!.apply(
                                    color: typeTheme
                                        ? AppColors.textDarkColor
                                        : AppColors.textLightColor),
                              )
                            ],
                          ),
                        ),
                      );
                    }))),
                    const SizedBox(
                      width: 2,
                    ),
                    Expanded(
                      child: Obx((() {
                        return CustomiesCardInkwel(
                          color: typeTheme
                              ? AppColors.appBarDarkColor
                              : AppColors.scaffoldLightColor,
                          onTab: () {
                            mainController.gender.value = "female";
                          },
                          select: mainController.gender.value == "female"
                              ? true
                              : false,
                          chaild: SizedBox(
                            height: mainController.size.height / 8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/fmale.png',
                                  height: mainController.size.height / 14,
                                ),
                                Text(
                                  'fmale'.tr,
                                  style: Get.textTheme.headline3!.apply(
                                      color: typeTheme
                                          ? AppColors.textDarkColor
                                          : AppColors.textLightColor),
                                )
                              ],
                            ),
                          ),
                        );
                      })),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                //height
                CustomiesCard(
                  color: typeTheme
                      ? AppColors.appBarDarkColor
                      : AppColors.scaffoldLightColor,
                  chaild: SizedBox(
                    height: mainController.size.height / 4,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'height'.tr,
                          style: Get.textTheme.headline3!.apply(
                              color: typeTheme
                                  ? AppColors.textDarkColor
                                  : AppColors.textLightColor),
                        ),
                        SizedBox(
                          height: (Get.size.height / 19) * 1.5,
                          width: (Get.size.width / 5) * 4,
                          child: HeightNumber(
                            color: typeTheme
                                ? AppColors.textDarkColor
                                : AppColors.textLightColor,
                            result: (int height) {
                              mainController.height = height;
                            },
                          ),
                        ),
                        SizedBox(
                          height: (Get.size.height / 19) * 1.5,
                          width: (Get.size.width / 7) * 5,
                          child: Ruler(
                            color: typeTheme
                                ? AppColors.rulerDarckColor
                                : AppColors.rulerLightColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),

                Row(
                  children: [
                    Expanded(
                      child: CustomiesCard(
                        color: typeTheme
                            ? AppColors.appBarDarkColor
                            : AppColors.scaffoldLightColor,
                        chaild: SizedBox(
                          height: mainController.size.height / 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'weight'.tr,
                                style: Get.textTheme.headline3!.apply(
                                    color: typeTheme
                                        ? AppColors.textDarkColor
                                        : AppColors.textLightColor),
                              ),
                              Container(
                                width: (Get.size.width / 3.5),
                                height: (Get.size.height / 18.5) * 1.5,
                                decoration: BoxDecoration(
                                  color: typeTheme
                                      ? AppColors.appBarDarkColor
                                      : AppColors.cardLightColor,
                                  border: Border.all(
                                    color: typeTheme
                                        ? AppColors.rulerDarckColor
                                        : AppColors.rulerLightColor,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: HeightNumber(
                                  color: typeTheme
                                      ? AppColors.textDarkColor
                                      : AppColors.textLightColor,
                                  result: (int weight) {
                                    mainController.weight = weight;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: CustomiesCard(
                        color: typeTheme
                            ? AppColors.appBarDarkColor
                            : AppColors.scaffoldLightColor,
                        chaild: SizedBox(
                          height: mainController.size.height / 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'age'.tr,
                                style: Get.textTheme.headline3!.apply(
                                    color: typeTheme
                                        ? AppColors.textDarkColor
                                        : AppColors.textLightColor),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      mainController.discrementAge();
                                    },
                                    icon: Icon(
                                      CupertinoIcons.minus_square,
                                      size: 32,
                                      color: typeTheme
                                          ? AppColors.textDarkColor
                                          : AppColors.textLightColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    mainController.age.toString(),
                                    style: Get.textTheme.headline4!.apply(
                                      color: typeTheme
                                          ? AppColors.textDarkColor
                                          : AppColors.textLightColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      mainController.incrementAge();
                                    },
                                    icon: Icon(
                                      CupertinoIcons.plus_app,
                                      size: 32,
                                      color: typeTheme
                                          ? AppColors.textDarkColor
                                          : AppColors.textLightColor,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                InkWell(
                  onTap: () {
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
                                            height: mainController.size.height /
                                                2.5,
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
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'save'.tr,
                                                        style: Get.textTheme
                                                            .subtitle2!
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
                                                        checkColor:
                                                            Colors.black,
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
                                                    padding:
                                                        const EdgeInsets.all(
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
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'inter_other_name'
                                                                .tr,
                                                        labelStyle: Get
                                                            .textTheme
                                                            .bodyText1!
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
                                                          barBlur: 10,
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
                                      onPressed: () {
                                        Share.share(
                                            "${'yourbmi'.tr} \n ${mainController.bmi.toStringAsFixed(2)} ${'kg'.tr} \n ${mainController.status} \n ${mainController.textBmi}");
                                      },
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
                  },
                  child: Container(
                    width: Get.width,
                    height: Get.height / 13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: typeTheme
                          ? AppColors.floatActionDarkColor
                          : AppColors.floatActionLightColor,
                    ),
                    child: Center(
                      child: Text(
                        'bmi'.tr,
                        style: Get.textTheme.subtitle2!.apply(
                          color: typeTheme ? AppColors.white : AppColors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
