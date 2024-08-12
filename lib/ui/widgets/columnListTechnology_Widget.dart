import 'package:animate_on_hover/animate_on_hover.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
  final Function createDialogTechnology;
  final bool isDarkMode;
  const ColumnListTechnologyWidget(
      {super.key,
      required this.listTechnology,
      required this.isMobile,
      required this.size,
      required this.title,
      required this.beveledRectangleBorder,
      required this.createDialogTechnology,
      required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: ExpansionTile(
          collapsedShape: beveledRectangleBorder,
          shape: beveledRectangleBorder,
          iconColor: Colors.transparent,
          childrenPadding: const EdgeInsets.all(10),
          tilePadding: const EdgeInsets.only(left: 36,top: 4,bottom: 6),
          title: Center(
                  child: AutoSizeText(
                title,
                maxLines: 1,
                style: const TextStyle(fontSize: 24),
              )),
          collapsedIconColor: Colors.transparent,
          children: List.generate(listTechnology.length, (index) {
            return TechnologyView(
              size: size,
              technology: listTechnology[index],
              isMobile: isMobile,
              createFrame: createDialogTechnology,
              isDarkMode: isDarkMode,
            ).increaseSizeOnHover(1.1);
          })),
    );
  }
}
