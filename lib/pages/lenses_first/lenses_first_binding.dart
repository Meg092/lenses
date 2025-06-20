import 'package:get/get.dart';

import 'lenses_first_logic.dart';

class LensesFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LensesFirstLogic());
  }
}
