import 'package:bmi_application/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class ChartScreen extends StatelessWidget {
  ChartScreen({Key? key}) : super(key: key);

  MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    // final info = mainController.getInfoUserByIndex(0);
    return Container();
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