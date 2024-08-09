import 'package:animate_on_hover/animate_on_hover.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyect_porfolio/ui/widgets/technology_widget.dart';

import '../../models/Technology.dart';

class ColumnListTechnologyWidget extends StatelessWidget {
  final List<Technology> listTechnology;
  final bool isMobile;
  final Size size;
  final String title;
  final BeveledRectangleBorder beveledRectangleBorder;
  final Function createFrame;
  const ColumnListTechnologyWidget(
      {super.key,
      required this.listTechnology,
      required this.isMobile,
      required this.size,
      required this.title,
      required this.beveledRectangleBorder,
      required this.createFrame});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      child: ExpansionTile(
          collapsedShape: beveledRectangleBorder,
          shape: beveledRectangleBorder,
          iconColor: Colors.transparent,
          childrenPadding: const EdgeInsets.all(10),
          title: Padding(
              padding: const EdgeInsets.only(left: 36),
              child: Center(
                  child: Text(
                title,
                style: const TextStyle(fontSize: 30),
              ))),
          collapsedIconColor: Colors.transparent,
          children: List.generate(listTechnology.length, (index) {
            return TechnologyView(
              size: size,
              technology: listTechnology[index],
              isMobile: isMobile,
              createFrame: createFrame,
            ).increaseSizeOnHover(1.1);
          })),
    );
  }
}
