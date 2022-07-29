import 'package:bmi_application/models/info_user.dart';
import 'package:bmi_application/utils/lanqueages.dart';
import 'package:bmi_application/utils/theme.dart';
import 'package:bmi_application/views/summeryscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(InfoUserAdapter());
  await Hive.openBox('infouser');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      home: SummeryScreen(),
    );
  }
}
