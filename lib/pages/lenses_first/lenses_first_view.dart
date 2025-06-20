import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lenses/pages/lenses_first/first_item.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../main.dart';
import 'lenses_first_logic.dart';

class LensesFirstPage extends StatefulWidget {
  const LensesFirstPage({Key? key}) : super(key: key);

  @override
  State<LensesFirstPage> createState() => _LensesFirstPageState();
}

class _LensesFirstPageState extends State<LensesFirstPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  LensesFirstLogic controller = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        const SizedBox(
          width: double.infinity,
          height: double.infinity,
        ),
        Image.asset(
          'assets/bg.webp',
          width: double.infinity,
          height: 261,
          fit: BoxFit.cover,
        ),
        const Positioned(
            left: 15,
            top: 60,
            child: SizedBox(
              width: 280,
              child: Text(
                'Management of colored contact lenses',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            )),
        SafeArea(
            child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Theme(
                data: ThemeData(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    useMaterial3: true
                ),
                child: TabBar(
                  tabAlignment: TabAlignment.fill,
                  controller: _tabController,
                  splashFactory: NoSplash.splashFactory,
                  labelPadding: EdgeInsets.zero,
                  labelStyle: TextStyle(
                    color: primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                  indicatorColor: primaryColor,
                  tabs: [
                    SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: Tab(
                          text: typeTitles[0],
                        )),
                    SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: Tab(
                          text: typeTitles[1],
                        )),
                    SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: Tab(
                          text: typeTitles[2],
                        )),
                    SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: Tab(
                          text: typeTitles[3],
                        )),
                  ],
                ),
              ),
            ).marginSymmetric(vertical: 10),
            Expanded(
                child: Container(
              width: double.infinity,
              child: GetBuilder<LensesFirstLogic>(builder: (_) {
                return TabBarView(
                  controller: _tabController,
                  children: [
                    FirstItem(controller.lensesListFirst, () {
                      controller.getData();
                    }),
                    FirstItem(controller.lensesListSecond, () {
                      controller.getData();
                    }),
                    FirstItem(controller.lensesListThird, () {
                      controller.getData();
                    }),
                    FirstItem(controller.lensesListFourth, () {
                      controller.getData();
                    })
                  ],
                );
              }),
            ))
          ].toColumn(),
        )
                .decorated(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)))
                .marginOnly(top: 150))
      ].toStack(),
    );
  }
}
