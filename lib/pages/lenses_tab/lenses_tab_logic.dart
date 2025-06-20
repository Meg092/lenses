import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class LensesTabLogic extends GetxController {

  PageController pageController = PageController();
  var currentIndex = 0.obs;

  void avnkabkjx() async {
    final hadNetwork = await InternetConnectionChecker.instance.hasConnection;
    if (!hadNetwork) {
      Get.toNamed('/lensesErrorPage');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    avnkabkjx();
    super.onInit();
  }

}
