import 'package:get/get.dart';

import 'lenses_second_logic.dart';

class LensesSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LensesSecondLogic());
  }
}
