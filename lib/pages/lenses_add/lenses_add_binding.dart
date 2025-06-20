import 'package:get/get.dart';

import 'lenses_add_logic.dart';

class LensesAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LensesAddLogic());
  }
}
