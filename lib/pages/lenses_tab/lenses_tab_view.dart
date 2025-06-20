import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lenses/pages/lenses_add/lenses_add_view.dart';
import 'package:lenses/pages/lenses_first/lenses_first_logic.dart';
import 'package:lenses/pages/lenses_first/lenses_first_view.dart';
import 'package:lenses/pages/lenses_second/lenses_second_view.dart';

import 'lenses_tab_logic.dart';

class LensesTabPage extends GetView<LensesTabLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          const LensesFirstPage(),
          LensesAddPage(),
          LensesSecondPage()
        ],
      ),
      bottomNavigationBar: Obx(() => _navLensesBars()),
    );
  }

  Widget _navLensesBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/item0Grey.webp',
            width: 22,
            fit: BoxFit.cover,
          ),
          activeIcon: Image.asset(
            'assets/item0Light.webp',
            width: 22,
            fit: BoxFit.cover,
          ),
          label: 'List',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/item1Light.webp',
            width: 22,
            fit: BoxFit.cover,
          ),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/item2Grey.webp',
            width: 22,
            fit: BoxFit.cover,
          ),
          activeIcon: Image.asset(
            'assets/item2Light.webp',
            width: 22,
            fit: BoxFit.cover,
          ),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) async {
        if (index == 1) {
          Get.toNamed('/lensesAddPage')?.then((_) {
            LensesFirstLogic firstLogic = Get.find<LensesFirstLogic>();
            firstLogic.getData();
          });
        } else {
          controller.currentIndex.value = index;
          controller.pageController.jumpToPage(index);
        }
      },
    );
  }
}
