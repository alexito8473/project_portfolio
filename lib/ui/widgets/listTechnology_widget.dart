import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyect_porfolio/ui/widgets/technology_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../models/Technology.dart';

class TechnologyWidget extends StatelessWidget {
  final Size size;
  final double spaceFinal;
  final List<Technology> listTechnology;
  final Duration durationAnimation;
  final bool isMobile;
  const TechnologyWidget(
      {super.key,
      required this.size,
      required this.spaceFinal,
      required this.listTechnology,
      required this.durationAnimation,
      required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        margin: EdgeInsets.only(top: size.height * 0.05),
        width: spaceFinal,
        duration: durationAnimation,
        child: Column(
          children: [
            AnimatedContainer(
                width: spaceFinal,
                duration: durationAnimation,
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(AppLocalizations.of(context)!.technologies,
                    style: const TextStyle(fontSize: 40))),
            Wrap(
              spacing: 20,
              runSpacing: 30,
              children: [
                ListTechnologyWidget(
                  listTechnology: listTechnology
                      .where(
                        (element) =>
                            element.typeLanguage == TypeLanguage.MOBILE,
                      )
                      .toList(),
                  isMobile: isMobile,
                  size: size,
                  borderColor: Colors.blue,
                  title: 'Mobile',
                ),
                ListTechnologyWidget(
                  listTechnology: listTechnology
                      .where(
                        (element) =>
                            element.typeLanguage == TypeLanguage.BACKEND,
                      )
                      .toList(),
                  isMobile: isMobile,
                  size: size,
                  borderColor: Colors.blue,
                  title: 'Backend',
                ),
                ListTechnologyWidget(
                  listTechnology: listTechnology
                      .where(
                        (element) =>
                            element.typeLanguage == TypeLanguage.FRONTEND,
                      )
                      .toList(),
                  isMobile: isMobile,
                  size: size,
                  borderColor:Colors.blue,
                  title: 'Frontend',
                ),
                ListTechnologyWidget(
                  listTechnology: listTechnology
                      .where(
                        (element) =>
                            element.typeLanguage == TypeLanguage.LEARNING,
                      )
                      .toList(),
                  isMobile: isMobile,
                  size: size,
                  borderColor:Colors.blue,
                  title: 'Learning',
                ),
                ListTechnologyWidget(
                  listTechnology: listTechnology
                      .where(
                        (element) => element.typeLanguage == TypeLanguage.TOOLS,
                      )
                      .toList(),
                  isMobile: isMobile,
                  size: size,
                  borderColor:Colors.blue,
                  title: 'Tools',
                ),
              ],
            )
          ],
        ));
  }
}

class ListTechnologyWidget extends StatelessWidget {
  final List<Technology> listTechnology;
  final bool isMobile;
  final Size size;
  final Color borderColor;
  final String title;
  const ListTechnologyWidget(
      {super.key,
      required this.listTechnology,
      required this.isMobile,
      required this.size,
      required this.borderColor,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 270,
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
                margin: EdgeInsets.only(left: 30),
                alignment: Alignment.center,
                child:Text(
                  title,
                  style: const TextStyle(fontSize: 30),
                )
              ),
          backgroundColor: Colors.transparent,
          collapsedIconColor: Colors.transparent,
          children: [
            Column(
              children: listTechnology.map((item) {
                return TechnologyView(
                  size: size,
                  technology: item,
                  isMobile: isMobile,
                );
              }).toList(),
            )
          ],
        ));
  }
}
