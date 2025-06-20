import 'package:flutter/material.dart';
import 'package:lenses/db_lenses/lenses_entity.dart';
import 'package:lenses/main.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:get/get.dart';

class FirstItem extends StatefulWidget {
  const FirstItem(this.list, this.onTap, {Key? key}) : super(key: key);
  final List<LensesEntity> list;
  final VoidCallback onTap;

  @override
  State<FirstItem> createState() => _FirstItemState();
}

class _FirstItemState extends State<FirstItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return widget.list.isEmpty
        ? const Center(
            child: Text('No data'),
          )
        : ListView.builder(
            itemCount: widget.list.length,
            itemBuilder: (_, index) {
              final entity = widget.list[index];
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                child: <Widget>[
                  <Widget>[
                    <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.memory(
                          entity.leftImage,
                          width: 86,
                          height: 61,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 22,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        alignment: Alignment.center,
                        child: const Text('Left'),
                      ).decorated(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(6))
                    ].toStack(),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: <Widget>[
                      <Widget>[
                        const Text(
                          'Color: ',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Expanded(
                            child: Text(
                          entity.colorStr,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ))
                      ].toRow(),
                      <Widget>[
                        const Text(
                          'Opened or not: ',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Expanded(
                            child: Text(
                          entity.isOpen == 1 ? 'Open' : 'Closed',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ))
                      ].toRow()
                    ].toColumn(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start))
                  ].toRow(),
                  const SizedBox(
                    height: 10,
                  ),
                  <Widget>[
                    <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.memory(
                          entity.rightImage,
                          width: 86,
                          height: 61,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 22,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        alignment: Alignment.center,
                        child: const Text('Right'),
                      ).decorated(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(6))
                    ].toStack(),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: <Widget>[
                      <Widget>[
                        const Text(
                          'Diameter: ',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Expanded(
                            child: Text(
                          '${entity.diameter}mm',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ))
                      ].toRow(),
                      <Widget>[
                        const Text(
                          'Degree: ',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Expanded(
                            child: Text(
                          '${entity.degree}°',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ))
                      ].toRow()
                    ].toColumn(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start)),
                    Container(
                      height: 38,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: <Widget>[
                        const Text('Manage'),
                        const Icon(
                          Icons.keyboard_arrow_right,
                          size: 20,
                          color: Colors.black,
                        )
                      ].toRow(),
                    ).decorated(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6))
                  ].toRow()
                ].toColumn(),
              )
                  .decorated(
                      color: const Color(0xfff8f8f8),
                      borderRadius: BorderRadius.circular(6))
                  .marginOnly(bottom: 10)
                  .gestures(onTap: () {
                Get.toNamed('/lensesAddPage', arguments: entity)
                    ?.then((_) {
                  widget.onTap.call();
                });
              });
            });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
