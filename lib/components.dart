import 'package:bmi_application/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';

class GetStartButton extends StatelessWidget {
  const GetStartButton(
      {Key? key, required this.size, required this.onTab, required this.color})
      : super(key: key);
  final Size size;
  final VoidCallback onTab;
  final Color color;
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
          color: color,
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
  const SkipButton(
      {Key? key,
      required this.size,
      required this.onTab,
      required this.color,
      required this.colorText})
      : super(key: key);
  final Size size;
  final VoidCallback onTab;
  final Color color;
  final Color colorText;
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
              color: color,
              //AppColors.btnLightColor,
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              'skip'.tr,
              style: Get.textTheme.headline1!.apply(color: colorText),
            ),
          ),
        ),
      ),
    );
  }
}

class ControlButton extends StatelessWidget {
  const ControlButton(
      {Key? key,
      required this.size,
      required this.onTab,
      required this.widgets,
      required this.bgColor})
      : super(key: key);
  final Size size;
  final VoidCallback onTab;
  final List<Widget> widgets;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        width: size.width / 4,
        height: size.height / 12,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            border: Border.all(
              color: Colors.grey,
              width: 2,
            ),
            color: bgColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: widgets,
        ),
      ),
    );
  }
}

class CustomiesCardInkwel extends StatelessWidget {
  const CustomiesCardInkwel({
    Key? key,
    required this.chaild,
    required this.onTab,
    required this.select,
    required this.color,
  }) : super(key: key);

  final Widget chaild;
  final VoidCallback onTab;
  final bool select;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: select
                ? AppColors.selectedCardLightColor
                : AppColors.cardLightColor ,
            width: 3,
          ),
        ),
        child: chaild,
      ),
    );
  }
}

class CustomiesCard extends StatelessWidget {
  const CustomiesCard({Key? key, required this.chaild, required this.color})
      : super(key: key);

  final Widget chaild;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(
          color: AppColors.cardLightColor,
          width: 3,
        ),
      ),
      child: chaild,
    );
  }
}

ScrollController scrollController = ScrollController();

class HeightNumber extends StatelessWidget {
  const HeightNumber({Key? key, required this.result, required this.color})
      : super(key: key);

  final Function(int) result;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: (Get.size.height / 19) * 1.5,
      child: InViewNotifierList(
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        initialInViewIds: const ['2'],
        isInViewPortCondition:
            (double deltaTop, double deltaBottom, double vpHeight) {
          return deltaTop < (0.5 * vpHeight) + 5.0 &&
              deltaBottom > (0.5 * vpHeight) - 5.0;
        },
        itemCount: 230,
        builder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            child: InViewNotifierWidget(
              id: index.toString(),
              builder: (BuildContext context, bool isInView, Widget? child) {
                result(index);
                //final String inViewTxt = isInView ? 'inView' : 'notInView';
                // print(id);
                return Text(
                  index.toString(),
                  // key: ValueKey("item-$index"),
                  style: isInView
                      ? Get.textTheme.headline4!.apply(color: color)
                      : Get.textTheme.subtitle1!.apply(color: color),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// ListView.builder(
//           physics: const BouncingScrollPhysics(),
//           scrollDirection: Axis.horizontal,
//           itemCount: 230,
//           itemBuilder: ((context, index) {
//             return Center(
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 18),
//                 child: Text(
//                   "$index",
//                   style: Get.textTheme.subtitle1!
//                       .apply(color: AppColors.textLightColor),
//                 ),
//               ),
//             );
//           })),

class Ruler extends StatelessWidget {
  const Ruler({Key? key, required this.color}) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: ((context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 8),
          child: VerticalDivider(
            color: color,
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
          return Padding(
            padding: const EdgeInsets.only(left: 8),
            child: VerticalDivider(
              color: color,
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
