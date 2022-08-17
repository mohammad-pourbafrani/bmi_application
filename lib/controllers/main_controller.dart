import 'dart:developer' as developer;

import 'package:bmi_application/models/info_user.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'dart:math';
import 'package:hive/hive.dart';

class MainController extends GetxController {
  //variables
  var size = Get.size;
  var bottomNavIndex = 2.obs;
  var gender = "female".obs;
  var height = 0;
  var weight = 0;
  var age = 0;
  var bmi = 0.0;
  var status = "";
  var textBmi = "";
  var year = DateTime.now().year;
  var time = DateTime.now();
  var month = DateTime.now().month;
  RxDouble minYWeight = 40.0.obs;
  RxDouble maxYWeight = 100.0.obs;
  RxDouble maxYbmi = 100.0.obs;
  RxDouble minYbmi = 10.0.obs;
  RxDouble interverBmi = 10.0.obs;
  RxDouble intervelWeight = 10.0.obs;

  var dbName = 'infouser';
  RxBool checkBoxSave = false.obs;

  final nameSelectBox = "".obs;

  var floatingActionButtonLocation = FloatingActionButtonLocation.centerDocked;

  //lists

  List userInformation = <InfoUser>[];
  List<InfoUser> dataUserInfoFilter = [];
  List<InfoUser> dataChartInfoFilter = [];
  RxList<FlSpot> weightSpots = RxList();
  RxList<FlSpot> bmiSpots = RxList();

  //other controller

  TextEditingController addNameController = TextEditingController();

  //function

  @override
  void onInit() async {
    await Hive.openBox('detiails');
    loadLanquage();
    getAllInfo();
    super.onInit();
  }

  void saveLanquage({String? country, String? lanquage}) {
    var lanBox = Hive.box('detiails');
    lanBox.put('countryCod', country);
    lanBox.put('lanCod', lanquage);
  }

  void loadLanquage() {
    var lanBox = Hive.box('detiails');
    if (lanBox.isNotEmpty) {
      String country = lanBox.get('countryCod');
      String lan = lanBox.get('lanCod');
      Locale locale = Locale(lan, country);
      Get.updateLocale(locale);
    }
  }

  void changeLocationFloatAction(int val) {
    floatingActionButtonLocation = val != 2
        ? FloatingActionButtonLocation.miniEndFloat
        : FloatingActionButtonLocation.centerDocked;
    update();
  }

  void incrementAge() {
    age++;
    update();
  }

  void discrementAge() {
    if (age != 0) {
      age--;
      update();
    }
  }

  void getBmi() {
    var bmi = (weight / pow(height / 100, 2));
    this.bmi = bmi;
    if (bmi < 18.5) {
      status = 'notgood'.tr;
      textBmi = 'range1'.tr;
    } else if (bmi >= 18.5 && bmi <= 25) {
      status = 'normal'.tr;
      textBmi = 'range2'.tr;
    } else if (bmi > 25 && bmi <= 30) {
      status = 'notgood'.tr;
      textBmi = 'range3'.tr;
    } else if (bmi > 30 && bmi <= 35) {
      status = 'notgood'.tr;
      textBmi = 'range4'.tr;
    } else {
      status = 'notgood'.tr;
      textBmi = 'range5'.tr;
    }
  }

  InfoUser createInfoUser() {
    String personName = "";
    if (checkBoxSave.value == true) {
      personName = "me";
    } else if (addNameController.text.trim() != "") {
      personName = addNameController.text;
    }
    return InfoUser(
      name: personName,
      age: age,
      gender: gender.value,
      height: height,
      weight: weight,
      bmi: bmi,
      date: DateTime.parse(DateTime.now().toString().substring(0, 10)),
      status: status,
    );
  }

  void addInfo(InfoUser infoUser) {
    var infoUserBox = Hive.box(dbName);
    infoUserBox.add(infoUser);
    checkBoxSave.value = false;
    addNameController.clear();
  }

  bool checkStatus(String status) {
    if (status == "normal" || status == "طبیعی") {
      return true;
    } else {
      return false;
    }
  }

  getInfoUserByIndex(int index) {
    var infoUserBox = Hive.box(dbName);
    return infoUserBox.getAt(index) as InfoUser;
  }

  getAllInfo() async {
    Box box;
    try {
      box = Hive.box(dbName);
    } catch (error) {
      box = await Hive.openBox<InfoUser>(dbName);
    }

    userInformation = [];
    userInformation = box.values.toList();
  }

  void filterData(String filterName) {
    getAllInfo();
    dataUserInfoFilter = [];
    for (var element in userInformation) {
      if (element.name == filterName) {
        dataUserInfoFilter.add(element);
      }
    }
    update();
  }

  void fliterDataChart() {
    getAllInfo();
    dataChartInfoFilter = [];
    bool check = false;

    // for (var i = 0; i < userInformation.length; i++) {
    //   if (userInformation[i].name == "me") {
    //     print(i);
    //     if (dataChartInfoFilter.isNotEmpty) {
    //       // print(dataChartInfoFilter[i].date.toString());
    //       if (dataChartInfoFilter[i].date.toString().substring(0, 10) !=
    //           userInformation[i].date.day.toString().substring(0, 10)) {
    //         dataChartInfoFilter.add(userInformation[i]);
    //       }
    //     } else {
    //       dataChartInfoFilter.add(userInformation[i]);
    //     }
    //   }
    // }

    for (var i = 0; i < userInformation.length; i++) {
      if (userInformation[i].name == "me") {
        for (var j = 0; j < dataChartInfoFilter.length; j++) {
          if (userInformation[i].date == dataChartInfoFilter[j].date) {
            check = true;
            dataChartInfoFilter[j] = userInformation[i];
          }
        }
        if (check == false) {
          dataChartInfoFilter.add(userInformation[i]);
        } else {
          check = false;
        }
      }
    }
  }

  fillDataChart() {
    fliterDataChart();
    weightSpots.clear();
    bmiSpots.clear();
    minYWeight.value = 40;
    maxYbmi.value = 100;
    maxYWeight.value = 100;
    var mood = 0.0;
    for (var element in dataChartInfoFilter) {
      if (element.date.year == time.year && element.date.month == time.month) {
        if (element.weight < minYWeight.value) {
          minYWeight.value = element.weight.toDouble();
          developer.log(minYWeight.toString(), name: "min y");
        }
        if (element.weight > maxYWeight.value) {
          maxYWeight.value = element.weight.toDouble();
          developer.log(maxYWeight.toString(), name: "max y");
        }
        if (element.bmi > maxYbmi.value) {
          maxYbmi.value = element.bmi.toDouble();
        }

        weightSpots.add(
            FlSpot(element.date.day.toDouble(), element.weight.toDouble()));
        bmiSpots
            .add(FlSpot(element.date.day.toDouble(), element.bmi.toDouble()));
      }
    }
    if (maxYWeight.value < 50) {
      mood = maxYWeight.value % 10;
      maxYWeight.value += 10 - mood.toDouble();
      minYWeight.value -= mood.toDouble();
      intervelWeight.value = 10.0;
    } else if (maxYWeight.value > 50 && maxYWeight.value < 150) {
      mood = maxYWeight.value % 20;
      maxYWeight.value += 20 - mood.toDouble();
      minYWeight.value -= mood.toDouble();
      intervelWeight.value = 20.0;
    } else if (maxYWeight.value > 150 && maxYWeight.value < 300) {
      mood = maxYWeight.value % 50;
      maxYWeight.value += 50 - mood.toDouble();
      minYWeight.value -= mood.toDouble();
      intervelWeight.value = 50.0;
    } else if (maxYWeight.value > 300) {
      mood = maxYWeight.value % 100;
      maxYWeight.value += 100 - mood.toDouble();
      minYWeight.value -= mood.toDouble();
      intervelWeight.value = 100.0;
    }
    if (maxYbmi.value < 50) {
      mood = maxYbmi.value % 10;
      maxYbmi.value += 10 - mood.toDouble();
      interverBmi.value = 10.0;
    } else if (maxYbmi.value > 50 && maxYbmi < 150) {
      mood = maxYbmi.value % 20;
      maxYbmi.value += 20 - mood.toDouble();
      interverBmi.value = 20.0;
    } else if (maxYbmi.value > 150 && maxYbmi < 300) {
      mood = maxYbmi.value % 50;
      maxYbmi.value += 50 - mood.toDouble();
      interverBmi.value = 50.0;
    } else if (maxYbmi.value > 300) {
      mood = maxYbmi.value % 100;
      maxYbmi.value += 100 - mood.toDouble();
      interverBmi.value = 100.0;
    }
  }

  List<String> getNames() {
    List<String> names = [];

    var box = Hive.box(dbName);

    for (var i in box.values) {
      if (!names.contains(i.name)) {
        names.add(i.name);
      }
    }
    return names;
  }
}
