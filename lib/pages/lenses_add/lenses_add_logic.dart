import 'dart:typed_data';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lenses/db_lenses/db_lenses.dart';

import '../../db_lenses/lenses_entity.dart';

class LensesAddLogic extends GetxController {

  DBLenses dbLenses = Get.find();

  LensesEntity? entity = Get.arguments;

  Uint8List? leftImage;
  Uint8List? rightImage;
  int type = 0;
  String colorStr = '';
  String degree = '';
  String diameter = '';
  int isOpen = 1;


  void imageSelected({bool isLeft = true}) async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(imageQuality: 90,maxWidth: 1024,source: ImageSource.gallery);
      if (pickedFile != null) {
        final imageBytes = await pickedFile.readAsBytes();
        if (isLeft) {
          leftImage = imageBytes;
        } else {
          rightImage = imageBytes;
        }
        update();
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Please check album permissions or select a new image');
      return;
    }
  }

  void addData() async {
    if (leftImage == null || rightImage == null) {
      Fluttertoast.showToast(msg: 'Please select images');
      return;
    }
    if (colorStr.isEmpty) {
      Fluttertoast.showToast(msg: 'Please input color');
      return;
    }
    if (degree.isEmpty) {
      Fluttertoast.showToast(msg: 'Please input degree');
      return;
    }
    if (diameter.isEmpty) {
      Fluttertoast.showToast(msg: 'Please input diameter');
      return;
    }
    num degreeNum = num.tryParse(degree) ?? 0;
    num diameterNum = num.tryParse(diameter) ?? 0;
    degree = degreeNum.toString();
    diameter = diameterNum.toString();
    update();
    if (entity  == null) {
      await dbLenses.insertLenses(LensesEntity(
        id:0,
        createdTime: DateTime.now(),
        leftImage: leftImage!,
        rightImage: rightImage!,
        type: type,
        colorStr: colorStr,
        degree: degree,
        diameter: diameter,
        isOpen: isOpen,
      ));
    } else {
      await dbLenses.updateLenses(LensesEntity(
        id:entity!.id,
        createdTime: DateTime.now(),
        leftImage: leftImage!,
        rightImage: rightImage!,
        type: type,
        colorStr: colorStr,
        degree: degree,
        diameter: diameter,
        isOpen: isOpen,
      ));
    }

    Fluttertoast.showToast(msg: 'Added successfully');
    Get.back();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    if (entity != null) {
      leftImage = entity!.leftImage;
      rightImage = entity!.rightImage;
      type = entity!.type;
      colorStr = entity!.colorStr;
      degree = entity!.degree;
      diameter = entity!.diameter;
      isOpen = entity!.isOpen;
      update();
    }
    super.onInit();
  }

}
