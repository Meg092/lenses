import 'package:get/get.dart';
import 'package:lenses/pages/lenses_first/lenses_first_logic.dart';

import '../lenses_second/lenses_second_logic.dart';
import 'lenses_tab_logic.dart';

class LensesTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LensesTabLogic());
    Get.lazyPut(() => LensesFirstLogic());
    Get.lazyPut(() => LensesSecondLogic());
  }
}
