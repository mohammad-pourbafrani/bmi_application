import 'package:animate_do/animate_do.dart';
import 'package:bmi_application/components.dart';
import 'package:bmi_application/controllers/summery_controller.dart';
import 'package:bmi_application/utils/appcolors.dart';
import 'package:bmi_application/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../models/itemes_model.dart';

class SummeryScreen extends StatelessWidget {
  SummeryScreen({Key? key}) : super(key: key);

  final SummeryController summeryController = Get.put(SummeryController());

  @override
  Widget build(BuildContext context) {
    bool typeTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(
      typeTheme
          ? const SystemUiOverlayStyle(
              statusBarColor: AppColors.scaffoldDarkColor,
              systemNavigationBarColor: AppColors.scaffoldDarkColor,
            )
          : const SystemUiOverlayStyle(
              statusBarColor: AppColors.scaffoldLightColor,
              systemNavigationBarColor: AppColors.scaffoldLightColor,
            ),
    );
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: summeryController.size.width,
          height: summeryController.size.height,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  controller: summeryController.pageController,
                  itemCount: summeryItems.length,
                  onPageChanged: (page) {
                    summeryController.curentIndex.value = page;
                  },
                  itemBuilder: ((context, index) {
                    return SizedBox(
                      width: summeryController.size.width,
                      height: summeryController.size.height,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(15, 30, 15, 10),
                            width: summeryController.size.width,
                            height: summeryController.size.height / 2.5,
                            child: animation(
                              index,
                              100,
                              Image.asset(summeryItems[index].img),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(15),
                              child: animation(
                                index,
                                300,
                                Text(
                                  summeryItems[index].title,
                                  textAlign: TextAlign.center,
                                  style: Get.textTheme.headline1!.apply(
                                    color: typeTheme
                                        ? AppColors.textTitleDarkColor
                                        : AppColors.textTitleLightColor,
                                  ),
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(right: 15, left: 15),
                            child: animation(
                              index,
                              500,
                              Text(
                                summeryItems[index].subtitle,
                                textAlign: TextAlign.center,
                                style: Get.textTheme.headline1!.apply(
                                  color: AppColors.textSubTitleLightColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    SmoothPageIndicator(
                      controller: summeryController.pageController,
                      count: summeryItems.length,
                      effect: ExpandingDotsEffect(
                          spacing: 6.0,
                          radius: 10.0,
                          dotWidth: 10.0,
                          dotHeight: 10.0,
                          expansionFactor: 3.8,
                          dotColor: typeTheme
                              ? AppColors.dotDarkColor
                              : AppColors.dotLightColor,
                          activeDotColor: typeTheme
                              ? AppColors.dotActiveDarkColor
                              : AppColors.dotActiveLightColor),
                      onDotClicked: (newIndex) {
                        summeryController.curentIndex.value = newIndex;
                        summeryController.pageController.animateToPage(
                          newIndex,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                    ),
                    Obx((() {
                      return summeryController.curentIndex.value == 2
                          ? GetStartButton(
                              color: typeTheme
                                  ? AppColors.btnDarckColor
                                  : AppColors.btnLightColor,
                              size: summeryController.size,
                              onTab: () {
                                Get.find<SummeryController>().onDelete();
                                Get.off(
                                  () => MainScreen(),
                                );
                              },
                            )
                          : SkipButton(
                              color: typeTheme
                                  ? AppColors.btnDarckColor
                                  : AppColors.btnLightColor,
                              colorText:
                                  typeTheme ? AppColors.white : AppColors.black,
                              size: summeryController.size,
                              onTab: () {
                                summeryController.pageController.animateToPage(
                                  2,
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.fastOutSlowIn,
                                );
                              },
                            );
                    }))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget animation(
  int index,
  int delay,
  Widget child,
) {
  if (index == 1) {
    return FadeInDown(
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }
  return FadeInUp(
    delay: Duration(milliseconds: delay),
    child: child,
  );
}
