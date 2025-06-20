import 'package:get/get.dart';
import 'package:lenses/db_lenses/db_lenses.dart';
import 'package:lenses/db_lenses/lenses_entity.dart';

class LensesFirstLogic extends GetxController {

  DBLenses dbLenses = Get.find();

  List<LensesEntity> lensesListFirst = [];
  List<LensesEntity> lensesListSecond = [];
  List<LensesEntity> lensesListThird = [];
  List<LensesEntity> lensesListFourth = [];

  void getData() async {
    final result = await dbLenses.getLensesAllData();
    lensesListFirst = result.where((element) => element.type == 0).toList();
    lensesListSecond = result.where((element) => element.type == 1).toList();
    lensesListThird = result.where((element) => element.type == 2).toList();
    lensesListFourth = result.where((element) => element.type == 3).toList();
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
