import 'package:bmi_application/components.dart';
import 'package:bmi_application/controllers/main_controller.dart';
import 'package:bmi_application/utils/appcolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldLightColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                //gender
                Row(
                  children: [
                    Expanded(child: Obx((() {
                      return CustomiesCardInkwel(
                        onTab: () {
                          mainController.gender.value = "male";
                        },
                        select: mainController.gender.value == "male"
                            ? true
                            : false,
                        chaild: SizedBox(
                          height: mainController.size.height / 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/male.png',
                                height: mainController.size.height / 7,
                              ),
                              Text(
                                'male'.tr,
                                style: Get.textTheme.headline3!
                                    .apply(color: AppColors.textLightColor),
                              )
                            ],
                          ),
                        ),
                      );
                    }))),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Obx((() {
                        return CustomiesCardInkwel(
                          onTab: () {
                            mainController.gender.value = "female";
                          },
                          select: mainController.gender.value == "female"
                              ? true
                              : false,
                          chaild: SizedBox(
                            height: mainController.size.height / 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/fmale.png',
                                  height: mainController.size.height / 7,
                                ),
                                Text(
                                  'fmale'.tr,
                                  style: Get.textTheme.headline3!
                                      .apply(color: AppColors.textLightColor),
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
                  height: 8,
                ),
                //height
                CustomiesCard(
                  chaild: SizedBox(
                    height: mainController.size.height / 4,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'height'.tr,
                          style: Get.textTheme.headline3!
                              .apply(color: AppColors.textLightColor),
                        ),
                        SizedBox(
                          height: (Get.size.height / 19) * 1.5,
                          width: (Get.size.width / 5) * 4,
                          child: HeightNumber(
                            result: (int height) {
                              mainController.height = height;
                            },
                          ),
                        ),
                        SizedBox(
                          height: (Get.size.height / 19) * 1.5,
                          width: (Get.size.width / 7) * 5,
                          child: const Ruler(),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                //
                Row(
                  children: [
                    Expanded(
                      child: CustomiesCard(
                        chaild: SizedBox(
                          height: mainController.size.height / 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'weight'.tr,
                                style: Get.textTheme.headline3!
                                    .apply(color: AppColors.textLightColor),
                              ),
                              Container(
                                width: (Get.size.width / 3.5),
                                height: (Get.size.height / 18.5) * 1.5,
                                decoration: BoxDecoration(
                                  color: AppColors.cardLightColor,
                                  border: Border.all(
                                    color: AppColors.rulerLightColor,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: HeightNumber(
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
                      width: 16,
                    ),
                    Expanded(
                      child: CustomiesCard(
                        chaild: SizedBox(
                          height: mainController.size.height / 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'age'.tr,
                                style: Get.textTheme.headline3!
                                    .apply(color: AppColors.textLightColor),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      mainController.discrementAge();
                                    },
                                    icon: const Icon(
                                      CupertinoIcons.minus_square,
                                      size: 32,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    mainController.age.toString(),
                                    style: Get.textTheme.headline4!.apply(
                                      color: AppColors.textLightColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      mainController.incrementAge();
                                    },
                                    icon: const Icon(
                                      CupertinoIcons.plus_app,
                                      size: 32,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
