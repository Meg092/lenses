import 'package:get/get.dart';

import 'lenses_err_logic.dart';

class LensesErrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LensesErrLogic());
  }
}
