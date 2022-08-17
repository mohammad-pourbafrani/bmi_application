import 'package:bmi_application/utils/appcolors.dart';
import 'package:bmi_application/views/main_screen.dart';
import 'package:bmi_application/views/summeryscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      checkFirstSeen();
    });
    super.initState();
  }

  Future checkFirstSeen() async {
    Box box;
    try {
      box = Hive.box("intro");
    } catch (error) {
      box = await Hive.openBox("intro");
    }
    if (box.get("seen") == true) {
      box.close();
      Get.off(MainScreen());
    } else if (box.get("seen") != true) {
      box.put("seen", true);
      box.close();
      Get.off(SummeryScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.scaffoldLightColor,
        systemNavigationBarColor: AppColors.scaffoldLightColor,
      ),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldLightColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                  height: 170,
                  image: AssetImage("assets/images/imagesplash.png")),
              SizedBox(
                height: 42,
              ),
              SpinKitFadingCube(
                color: AppColors.primeryLightColor,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
