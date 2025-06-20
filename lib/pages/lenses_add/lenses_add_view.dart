import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lenses/main.dart';
import 'package:lenses/pages/lenses_add/lenses_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

import 'lenses_add_logic.dart';

class LensesAddPage extends GetView<LensesAddLogic> {
  Widget _typeItem(int index) {
    return Container(
      height: 33,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      child: Text(
        typeTitles[index],
        style: TextStyle(
            color: controller.type == index ? Colors.white : Colors.grey),
      ),
    )
        .decorated(
            borderRadius: BorderRadius.circular(6),
            color: controller.type == index
                ? primaryColor
                : const Color(0xfff4f4f4))
        .gestures(onTap: () {
      controller.type = index;
      controller.update();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add colored contact lenses'),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<LensesAddLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: <Widget>[
                  <Widget>[
                    Expanded(
                        child: <Widget>[
                      const Text(
                        'Left lenses',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          width: double.infinity,
                          height: 106,
                          child: controller.leftImage == null
                              ? const Icon(
                                  Icons.add,
                                  size: 40,
                                  color: Colors.grey,
                                )
                              : Image.memory(controller.leftImage!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity),
                        )
                            .decorated(
                                color: const Color(0xfff5f5f5),
                                borderRadius: BorderRadius.circular(6),
                                border:
                                    Border.all(color: const Color(0xffd9d9d9)))
                            .gestures(onTap: () {
                          controller.imageSelected(isLeft: true);
                        }),
                      )
                    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start)),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: <Widget>[
                      const Text(
                        'Right lenses',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          width: double.infinity,
                          height: 106,
                          child: controller.rightImage == null
                              ? const Icon(
                                  Icons.add,
                                  size: 40,
                                  color: Colors.grey,
                                )
                              : Image.memory(controller.rightImage!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity),
                        )
                            .decorated(
                                color: const Color(0xfff5f5f5),
                                borderRadius: BorderRadius.circular(6),
                                border:
                                    Border.all(color: const Color(0xffd9d9d9)))
                            .gestures(onTap: () {
                          controller.imageSelected(isLeft: false);
                        }),
                      )
                    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start))
                  ].toRow(),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 33,
                    child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisSpacing: 10,
                                childAspectRatio: 33 / 126),
                        itemCount: typeTitles.length,
                        itemBuilder: (_, index) {
                          return _typeItem(index);
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Color',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                    child: LensesTextField(
                        padding: EdgeInsets.zero,
                        value: controller.colorStr,
                        maxLength: 10,
                        onChange: (v) {
                          controller.colorStr = v;
                        }),
                  ),
                  Divider(
                    height: 15,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Degree',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                    child: <Widget>[
                      Expanded(
                          child: LensesTextField(
                              padding: EdgeInsets.zero,
                              value: controller.degree,
                              isNumber: true,
                              maxLength: 10,
                              onChange: (v) {
                                controller.degree = v;
                              })),
                      const Text(
                        '°',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ].toRow(),
                  ),
                  Divider(
                    height: 15,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Diameter',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                    child: <Widget>[
                      Expanded(
                          child: LensesTextField(
                              padding: EdgeInsets.zero,
                              value: controller.diameter,
                              isNumber: true,
                              maxLength: 10,
                              onChange: (v) {
                                controller.diameter = v;
                              })),
                      const Text(
                        'mm',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ].toRow(),
                  ),
                  Divider(
                    height: 15,
                    color: Colors.grey.shade300,
                  ),
                  <Widget>[
                    const Text(
                      'Is open',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Switch(
                        value: controller.isOpen == 1 ? true : false,
                        activeTrackColor: Colors.green,
                        onChanged: (v) {
                          controller.isOpen = v ? 1 : 0;
                          controller.update();
                        })
                  ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    child: const Text(
                      'Add',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  )
                      .decorated(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10))
                      .gestures(onTap: () {
                    controller.addData();
                  })
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              ).decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(20))
            ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
          );
        }).marginAll(15)),
      ),
    );
  }
}
