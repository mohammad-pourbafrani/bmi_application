import 'package:bmi_application/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class GetStartButton extends StatelessWidget {
  GetStartButton({Key? key, required this.size, required this.onTab})
      : super(key: key);
  Size size;
  VoidCallback onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        margin: const EdgeInsets.only(top: 60),
        width: size.width / 1.5,
        height: size.height / 13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.btnLightColor,
        ),
        child: Center(
          child: Text(
            'getstart'.tr,
            style: Get.textTheme.headline1!.apply(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class SkipButton extends StatelessWidget {
  SkipButton({Key? key, required this.size, required this.onTab})
      : super(key: key);
  Size size;
  VoidCallback onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: InkWell(
        onTap: onTab,
        child: Container(
          margin: const EdgeInsets.only(top: 60),
          width: size.width / 1.5,
          height: size.height / 13,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: AppColors.btnLightColor,
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              'skip'.tr,
              style: Get.textTheme.headline1!.apply(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomiesCard extends StatelessWidget {
  CustomiesCard({Key? key, required this.chaild}) : super(key: key);

  Widget chaild;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(
            color: AppColors.selectCardLightColor,
            width: 3,
          ),
        ),
        child: chaild,
      ),
    );
  }
}
