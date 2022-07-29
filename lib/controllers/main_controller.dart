import 'package:bmi_application/models/info_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:hive/hive.dart';

class MainController extends GetxController {
  //variables

  var size = Get.size;
  var bottomNavIndex = 0.obs;
  var gender = "female".obs;
  var height = 0;
  var weight = 0;
  var age = 0;
  var bmi = 0.0;
  var status = "";
  var textBmi = "";

  var dbName = 'infouser';
  RxBool checkBoxSave = false.obs;

  var floatingActionButtonLocation = FloatingActionButtonLocation.centerDocked;

  //lists

  List<InfoUser> userInformation = [];

  //other controller

  TextEditingController addNameController = TextEditingController();

  //function

  @override
  void onInit() {
    super.onInit();
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
      date: DateTime.now(),
    );
  }

  void addInfo(InfoUser infoUser) {
    var infoUserBox = Hive.box(dbName);
    infoUserBox.add(infoUser);
    checkBoxSave.value = false;
    addNameController.clear();
  }

  getInfoUserByIndex(int index) {
    var infoUserBox = Hive.box(dbName);
    return infoUserBox.getAt(index) as InfoUser;
  }

  // getAllInfo() async {
  //   Box box;
  //   try {
  //     box = Hive.box(dbName);
  //   } catch (error) {
  //     box = await Hive.openBox(dbName);
  //   }

  //   var allData = box.get(dbName);
  //   print(allData);
  //   if (allData != null) {
  //     userInformation = allData.t;
  //   }
  // }

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
