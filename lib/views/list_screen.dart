import 'package:bmi_application/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class ListScreen extends StatelessWidget {
  ListScreen({Key? key}) : super(key: key);

  MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          child: Center(
            child: Container(
              margin: const EdgeInsets.only(left: 15, top: 10, right: 15),
              child: FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(12, 10, 20, 20),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: Text('select_name'.tr),
                        onChanged: (name) {},
                        isExpanded: true,
                        isDense: true,
                        items: mainController
                            .getNames()
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
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
        });

        */
