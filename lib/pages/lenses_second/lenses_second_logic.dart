import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lenses/db_lenses/db_lenses.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../lenses_first/lenses_first_logic.dart';

class LensesSecondLogic extends GetxController {

  DBLenses dbLenses = Get.find<DBLenses>();

  cleanLensesData() async {
    Get.dialog(AlertDialog(
      title: const Text('Warm reminder'),
      content: const Text('Do you want to clean all records?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel',style: TextStyle(color: Colors.black),),
        ),
        TextButton(
          onPressed: () async {
            await dbLenses.cleanLensesData();
            LensesFirstLogic firstLogic = Get.find<LensesFirstLogic>();
            firstLogic.getData();
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }

  aboutLensesUS(BuildContext context) async {
    var info = await PackageInfo.fromPlatform();
    showAboutDialog(
      applicationName: info.appName,
      applicationVersion: info.version,
      applicationIcon: Image.asset(
        'assets/launcher.webp',
        width: 76,
        height: 76,
      ),
      children: [
        const Text(
            """We can provide you with records of the self-service dance studio"""),
      ],
      context: context,
    );
  }

}
