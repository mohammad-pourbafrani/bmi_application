import 'package:bmi_application/controllers/main_controller.dart';
import 'package:bmi_application/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListScreen extends StatelessWidget {
  ListScreen({Key? key}) : super(key: key);

  final MainController mainController = Get.put(MainController());

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
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(12, 10, 20, 20),
                      enabledBorder: Get
                          .theme.inputDecorationTheme.enabledBorder!
                          .copyWith(
                        borderSide:
                            const BorderSide(width: 2.0, color: Colors.grey),
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: Obx(
                        () => DropdownButton<String>(
                          elevation: 4,
                          hint: mainController.nameSelectBox.value.isEmpty
                              ? Text(
                                  'select_name'.tr,
                                  style: Get.textTheme.subtitle2!.apply(
                                    color: Colors.black,
                                  ),
                                )
                              : Text(
                                  mainController.nameSelectBox.value,
                                  style: Get.textTheme.subtitle2!.apply(
                                    color: Colors.black,
                                  ),
                                ),
                          borderRadius: BorderRadius.circular(8),
                          style: Get.textTheme.headline3!.apply(
                            color: Colors.black,
                          ),
                          onChanged: (name) {
                            mainController.nameSelectBox.value = name!;
                            mainController.filterData(name);
                          },
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
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        SizedBox(
          width: Get.size.width,
          height: Get.size.height / 3 * 2,
          child: GetBuilder(
            init: MainController(),
            autoRemove: true,
            builder: (MainController mController) {
              return Opacity(
                opacity: mController.dataUserInfoFilter.isNotEmpty ? 1 : 0,
                child: ListView.builder(
                  itemCount: mController.dataUserInfoFilter.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: Container(
                        width: mainController.size.width,
                        height: mainController.size.height / 4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                            color: Colors.grey.shade300),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${'weight'.tr} : ${mController.dataUserInfoFilter[index].weight}",
                                    style: Get.textTheme.headline1!
                                        .apply(color: AppColors.textLightColor),
                                  ),
                                  Text(
                                    "${'height'.tr} : ${mController.dataUserInfoFilter[index].height}",
                                    style: Get.textTheme.headline1!
                                        .apply(color: AppColors.textLightColor),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${'text_bmi'.tr} : ${mController.dataUserInfoFilter[index].bmi.toStringAsFixed(2)}",
                                    style: Get.textTheme.headline3!
                                        .apply(color: AppColors.textLightColor),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${'status'.tr} : ${mController.dataUserInfoFilter[index].status}",
                                    style: Get.textTheme.headline3!
                                        .apply(color: AppColors.textLightColor),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  mController.dataUserInfoFilter[index].status
                                              .toLowerCase() ==
                                          "normal"
                                      ? const Icon(
                                          Icons.check_circle_outline_rounded,
                                          color: Colors.green,
                                        )
                                      : const ImageIcon(
                                          AssetImage("assets/icons/close.png"),
                                          color: Colors.red,
                                        )
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "${'date_save'.tr} : ${mController.dataUserInfoFilter[index].date.toString().substring(0, 10)}",
                                style: Get.textTheme.headline3!
                                    .apply(color: AppColors.textLightColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}



 /*

 SizedBox(
            width: Get.size.width,
            height: Get.size.height / 3 * 2,
            child: GetBuilder(
              init: MainController(),
              autoRemove: true,
              builder: (MainController mController) {
                return Opacity(
                  opacity: mController.dataUserInfoFilter.isNotEmpty ? 1 : 0,
                  child: ListView.builder(
                    itemCount: mController.dataUserInfoFilter.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: Container(
                          width: mainController.size.width,
                          height: mainController.size.height / 5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                              color: Colors.grey.shade300),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${'weight'.tr} : ${mController.dataUserInfoFilter[index].weight}",
                                      style: Get.textTheme.headline1!.apply(
                                          color: AppColors.textLightColor),
                                    ),
                                    Text(
                                      "${'height'.tr} : ${mController.dataUserInfoFilter[index].height}",
                                      style: Get.textTheme.headline1!.apply(
                                          color: AppColors.textLightColor),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${'text_bmi'.tr} : ${mController.dataUserInfoFilter[index].bmi.toStringAsFixed(2)}",
                                      style: Get.textTheme.headline3!.apply(
                                          color: AppColors.textLightColor),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${'status'.tr} : ${mController.dataUserInfoFilter[index].status}",
                                          style: Get.textTheme.headline3!.apply(
                                              color: AppColors.textLightColor),
                                        ),
                                        Icon(
                                          Icons.check_circle_outline,
                                          color: Colors.green,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "${'date_save'.tr} : ${mController.dataUserInfoFilter[index].date.toString().substring(0, 16)}",
                                  style: Get.textTheme.headline3!
                                      .apply(color: AppColors.textLightColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                );
              },
            )),

 */




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
