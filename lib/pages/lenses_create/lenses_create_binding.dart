import 'package:get/get.dart';

import 'lenses_create_logic.dart';

class LensesCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      LensesCreateLogic(),
      permanent: true,
    );
  }
}
