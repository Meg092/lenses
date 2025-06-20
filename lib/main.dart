import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lenses/db_lenses/db_lenses.dart';
import 'package:lenses/pages/lenses_add/lenses_add_binding.dart';
import 'package:lenses/pages/lenses_add/lenses_add_view.dart';
import 'package:lenses/pages/lenses_error/lenses_err_binding.dart';
import 'package:lenses/pages/lenses_error/lenses_err_view.dart';
import 'package:lenses/pages/lenses_first/lenses_first_binding.dart';
import 'package:lenses/pages/lenses_first/lenses_first_view.dart';
import 'package:lenses/pages/lenses_second/lenses_second_binding.dart';
import 'package:lenses/pages/lenses_second/lenses_second_view.dart';
import 'package:lenses/pages/lenses_tab/lenses_tab_binding.dart';
import 'package:lenses/pages/lenses_tab/lenses_tab_view.dart';

Color primaryColor = const Color(0xfffc9592);
Color bgColor = const Color(0xfff9f6f5);

List<String> typeTitles = ["Daily", "Monthly", "Half-year", "Year"];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Get.putAsync(() => DBLenses().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Eyes,
      initialRoute: '/lensesTabPage',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Eyes = [
  GetPage(name: '/lensesTabPage', page: () => LensesTabPage(), binding: LensesTabBinding()),
  GetPage(name: '/lensesFirstPage', page: () => const LensesFirstPage(), binding: LensesFirstBinding()),
  GetPage(name: '/lensesSecondPage', page: () => LensesSecondPage(), binding: LensesSecondBinding()),
  GetPage(name: '/lensesAddPage', page: () => LensesAddPage(), binding: LensesAddBinding()),
  GetPage(name: '/lensesErrorPage', page: () => LensesErrView(), binding: LensesErrBinding()),
];