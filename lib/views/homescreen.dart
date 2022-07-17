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
                //  header
                Text(
                  'textHeaderHomescreen'.tr,
                  style: Get.textTheme.headline4!.apply(
                    color: AppColors.textLightColor,
                  ),
                ),
                const SizedBox(height: 16),
                //gender
                Row(
                  children: [
                    Expanded(
                        child: CustomiesCardInkwel(
                      chaild: SizedBox(
                        height: mainController.size.height / 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/male.png',
                              height: mainController.size.height / 6,
                            ),
                            Text(
                              'male'.tr,
                              style: Get.textTheme.headline3!
                                  .apply(color: AppColors.textLightColor),
                            )
                          ],
                        ),
                      ),
                    )),
                    Expanded(
                      child: CustomiesCardInkwel(
                        chaild: SizedBox(
                          height: mainController.size.height / 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/fmale.png',
                                height: mainController.size.height / 6,
                              ),
                              Text(
                                'fmale'.tr,
                                style: Get.textTheme.headline3!
                                    .apply(color: AppColors.textLightColor),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
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
                          height: (Get.size.height / 18.5) * 1.5,
                          width: (Get.size.width / 5) * 4,
                          child: HeightNumber(),
                        ),
                        SizedBox(
                          height: (Get.size.height / 18.5) * 1.5,
                          width: (Get.size.width / 7) * 5,
                          child: const Ruler(),
                        )
                      ],
                    ),
                  ),
                ),
                //
                Row(
                  children: [
                    Expanded(
                      child: CustomiesCard(
                        chaild: SizedBox(
                          height: mainController.size.height / 4,
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
                                  RectangleMiniButton(
                                    chaild: const Icon(
                                      Icons.minimize_rounded,
                                    ),
                                  ),
                                  Text("25"),
                                  RectangleMiniButton(
                                    chaild: const Icon(
                                      CupertinoIcons.add,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomiesCard(
                        chaild: SizedBox(
                          height: mainController.size.height / 4,
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
                                  RectangleMiniButton(
                                    chaild: const Icon(
                                      Icons.minimize_rounded,
                                      size: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    "25",
                                    style: Get.textTheme.headline4!.apply(
                                      color: AppColors.textLightColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  RectangleMiniButton(
                                    chaild: const Icon(
                                      CupertinoIcons.add,
                                      size: 16,
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
