import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyect_porfolio/ui/widgets/technology_widget.dart';

import '../../models/Technology.dart';

class ColumnListTechnologyWidget extends StatelessWidget {
  final List<Technology> listTechnology;
  final bool isMobile;
  final Size size;
  final Color borderColor;
  final String title;
  const ColumnListTechnologyWidget(
      {super.key,
        required this.listTechnology,
        required this.isMobile,
        required this.size,
        required this.borderColor,
        required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 280,
        child: ExpansionTile(
          collapsedShape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: borderColor, width: 2),
          ),
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: borderColor, width: 2),
          ),
          expandedAlignment: Alignment.center,
          childrenPadding: const EdgeInsets.all(10),
          tilePadding: const EdgeInsets.symmetric(vertical: 10),
          trailing: const SizedBox(),
          title: Container(
              margin: const EdgeInsets.only(left: 30),
              alignment: Alignment.center,
              child:Text(
                title,
                style: const TextStyle(fontSize: 30),
              )
          ),
          backgroundColor: Colors.transparent,
          collapsedIconColor: Colors.transparent,
          children: listTechnology.map((item) {
            return TechnologyView(
              size: size,
              technology: item,
              isMobile: isMobile,
            );
          }).toList(),
        ));
  }
}
