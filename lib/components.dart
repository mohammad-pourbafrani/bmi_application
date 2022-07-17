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

class CustomiesCardInkwel extends StatelessWidget {
  CustomiesCardInkwel({Key? key, required this.chaild}) : super(key: key);

  Widget chaild;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        color: AppColors.scaffoldLightColor,
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

class CustomiesCard extends StatelessWidget {
  CustomiesCard({Key? key, required this.chaild}) : super(key: key);

  Widget chaild;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.scaffoldLightColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(
          color: AppColors.selectCardLightColor,
          width: 3,
        ),
      ),
      child: chaild,
    );
  }
}

class HeightNumber extends StatelessWidget {
  const HeightNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 230,
        itemBuilder: ((context, index) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Text(
                "$index",
                style: Get.textTheme.subtitle1!
                    .apply(color: AppColors.textLightColor),
              ),
            ),
          );
        }));
  }
}

class Ruler extends StatelessWidget {
  const Ruler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: ((context, index) {
        return const Padding(
          padding: EdgeInsets.only(left: 8),
          child: VerticalDivider(
            color: AppColors.rulerLightColor,
            thickness: 2,
            width: 10,
            indent: 20,
            endIndent: 20,
          ),
        );
      }),
      itemCount: 12,
      separatorBuilder: (BuildContext context, int index) {
        if (index % 5 == 0) {
          return const Padding(
            padding: EdgeInsets.only(left: 8),
            child: VerticalDivider(
              color: AppColors.rulerLightColor,
              thickness: 2,
              width: 10,
              indent: 10,
              endIndent: 10,
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class RectangleMiniButton extends StatelessWidget {
  RectangleMiniButton({Key? key, required this.chaild}) : super(key: key);
  Icon chaild;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.rulerLightColor,
          width: 4,
        ),
      ),
      child: chaild,
    );
  }
}
