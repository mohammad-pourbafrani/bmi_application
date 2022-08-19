import 'package:bmi_application/components.dart';
import 'package:bmi_application/controllers/main_controller.dart';
import 'package:bmi_application/utils/appcolors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartScreen extends StatelessWidget {
  ChartScreen({Key? key}) : super(key: key);

  final MainController mainController = Get.put(MainController());
  final List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  @override
  Widget build(BuildContext context) {
    bool typeTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: Get.size.width,
              height: Get.size.height / 9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ControlButton(
                    bgColor: typeTheme
                        ? AppColors.appBarDarkColor
                        : AppColors.bgLightColorButtonControl,
                    size: Get.size,
                    onTab: () {
                      mainController.time = mainController.time
                          .subtract(const Duration(days: 30));
                      mainController.fillDataChart();
                    },
                    widgets: [
                      Icon(
                        Icons.keyboard_double_arrow_left_rounded,
                        color: typeTheme
                            ? AppColors.textDarkColor
                            : AppColors.textLightColor,
                      ),
                      Text(
                        'last_month'.tr,
                        style: Get.textTheme.headline1!.apply(
                          color: typeTheme
                              ? AppColors.textDarkColor
                              : AppColors.textLightColor,
                        ),
                      ),
                    ],
                  ),
                  ControlButton(
                    bgColor: typeTheme
                        ? AppColors.appBarDarkColor
                        : AppColors.bgLightColorButtonControl,
                    size: Get.size,
                    onTab: () {
                      mainController.time = DateTime.now();
                      mainController.fillDataChart();
                    },
                    widgets: [
                      Text(
                        'current_month'.tr,
                        style: Get.textTheme.headline1!.apply(
                          color: typeTheme
                              ? AppColors.textDarkColor
                              : AppColors.textLightColor,
                        ),
                      ),
                    ],
                  ),
                  ControlButton(
                    bgColor: typeTheme
                        ? AppColors.appBarDarkColor
                        : AppColors.bgLightColorButtonControl,
                    size: Get.size,
                    onTab: () {
                      mainController.time =
                          mainController.time.add(const Duration(days: 30));
                      print(mainController.time);
                      mainController.fillDataChart();
                    },
                    widgets: [
                      Text(
                        'next_month'.tr,
                        style: Get.textTheme.headline1!.apply(
                          color: typeTheme
                              ? AppColors.textDarkColor
                              : AppColors.textLightColor,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_double_arrow_right_rounded,
                        color: typeTheme
                            ? AppColors.textDarkColor
                            : AppColors.textLightColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: Get.size.width,
                height: Get.size.height / 3 * 1.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: typeTheme
                        ? GradianetAppColors.backgrandColorDarkWeightChart
                        : GradianetAppColors.backgrandColorLightWeightChart,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Obx(
                    () => LineChart(
                      LineChartData(
                        backgroundColor: Colors.transparent,
                        //
                        //
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 30,
                              interval: 4,
                              getTitlesWidget: (value, meta) {
                                return Text(
                                  value.toInt().toString(),
                                  style: Get.textTheme.headline1!.apply(
                                    color: Colors.white,
                                  ),
                                );
                              },
                            ),
                          ),
                          topTitles: AxisTitles(
                            axisNameSize: 30,
                            axisNameWidget: Padding(
                              padding:
                                  const EdgeInsets.only(left: 50, right: 50),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'weight'.tr,
                                    style: Get.textTheme.headline2!.apply(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "${months[mainController.time.month]}  ${mainController.time.year}",
                                    style: Get.textTheme.headline2!.apply(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: mainController.intervelWeight.value,
                              reservedSize: 35,
                              getTitlesWidget: (value, meta) {
                                return Text(
                                  value.toInt().toString(),
                                  style: Get.textTheme.headline1!.apply(
                                    color: Colors.white,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        //
                        //
                        minX: 1,
                        maxX: 31,
                        minY: mainController.minYWeight.value,
                        maxY: mainController.maxYWeight.value,
                        //
                        //
                        gridData: FlGridData(
                          show: true,
                          verticalInterval: 2,
                          drawHorizontalLine: false,
                          drawVerticalLine: true,
                          getDrawingVerticalLine: (value) {
                            return FlLine(
                              color: Colors.white30,
                              strokeWidth: 1,
                            );
                          },
                        ),
                        //
                        //
                        borderData: FlBorderData(
                          show: false,
                        ),
                        //
                        //
                        lineBarsData: [
                          LineChartBarData(
                            spots: mainController.weightSpots.toList(),
                            isCurved: true,
                            color: Colors.white,
                            barWidth: 2,
                            belowBarData: BarAreaData(
                              show: true,
                              gradient: const LinearGradient(
                                colors:
                                    GradianetAppColors.belowColorWeightChart,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: Get.size.width,
                height: Get.size.height / 3 * 1.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: typeTheme
                        ? GradianetAppColors.backgrandDarkColorBmiChart
                        : GradianetAppColors.backgrandLightColorBmiChart,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Obx(
                    () => LineChart(
                      LineChartData(
                        backgroundColor: Colors.transparent,
                        //
                        //
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 30,
                              interval: 4,
                              getTitlesWidget: (value, meta) {
                                return Text(
                                  value.toInt().toString(),
                                  style: Get.textTheme.headline1!.apply(
                                    color: Colors.white,
                                  ),
                                );
                              },
                            ),
                          ),
                          topTitles: AxisTitles(
                            axisNameSize: 30,
                            axisNameWidget: Padding(
                              padding:
                                  const EdgeInsets.only(left: 50, right: 50),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'text_bmi'.tr,
                                    style: Get.textTheme.headline2!.apply(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "${months[mainController.time.month]}  ${mainController.time.year}",
                                    style: Get.textTheme.headline2!.apply(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: mainController.interverBmi.value,
                              reservedSize: 35,
                              getTitlesWidget: (value, meta) {
                                return Text(
                                  value.toInt().toString(),
                                  style: Get.textTheme.headline1!.apply(
                                    color: Colors.white,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        //
                        //
                        minX: 1,
                        maxX: 31,

                        maxY: mainController.maxYbmi.value,
                        minY: mainController.minYbmi.value,

                        //
                        //
                        gridData: FlGridData(
                          show: true,
                          verticalInterval: 2,
                          drawHorizontalLine: false,
                          drawVerticalLine: true,
                          getDrawingVerticalLine: (value) {
                            return FlLine(
                              color: Colors.white30,
                              strokeWidth: 1,
                            );
                          },
                        ),
                        //
                        //
                        borderData: FlBorderData(
                          show: false,
                        ),
                        //
                        //
                        lineBarsData: [
                          LineChartBarData(
                            spots: mainController.bmiSpots,
                            isCurved: true,
                            color: Colors.white,
                            barWidth: 2,
                            belowBarData: BarAreaData(
                              show: true,
                              gradient: const LinearGradient(
                                colors:
                                    GradianetAppColors.belowColorWeightChart,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

/*
ValueListenableBuilder(
          valueListenable: Hive.box(mainController.dbName).listenable(),
          builder: (context, Box infoUserBox, _) {
            return ListView.builder(
              itemCount: infoUserBox.length,
              itemBuilder: ((context, index) {
                final info = mainController.getInfoUserByIndex(index);
                return Ink(
                  child: ListTile(
                    title: Text(
                      info.name,
                    ),
                    subtitle: Text(info.bmi.toString()),
                  ),
                );
              }),
            );
          }),
          */
