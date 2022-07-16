import 'package:bmi_application/components.dart';
import 'package:bmi_application/controllers/main_controller.dart';
import 'package:bmi_application/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //header
              Text(
                'textHeaderHomescreen'.tr,
                style: Get.textTheme.headline4!.apply(
                  color: AppColors.textLightColor,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                      child: CustomiesCard(
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
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(
                          color: AppColors.selectCardLightColor,
                          width: 2,
                        ),
                      ),
                      child: SizedBox(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
