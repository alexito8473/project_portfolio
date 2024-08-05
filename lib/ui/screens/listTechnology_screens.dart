import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../models/Technology.dart';
import '../widgets/columnListTechnology_Widget.dart';

class TechnologyWidget extends StatelessWidget {
  final Size size;
  final double spaceFinal;
  final List<Technology> listTechnologyTools;
  final List<Technology> lisTechnologyMobile;
  final List<Technology> lisTechnologyBackend;
  final List<Technology> lisTechnologyFrontend;
  final List<Technology> lisTechnologyLearning;

  final Duration durationAnimation;
  final bool isMobile;
  const TechnologyWidget(
      {super.key,
      required this.size,
      required this.spaceFinal,
      required this.listTechnologyTools,
      required this.durationAnimation,
      required this.isMobile,
      required this.lisTechnologyMobile,
      required this.lisTechnologyBackend,
      required this.lisTechnologyFrontend,
      required this.lisTechnologyLearning});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: size.height * 0.05,right: size.width*0.12,left: size.width*0.12),
        child: Column(
          children: [
            Container(
                width: spaceFinal,
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(AppLocalizations.of(context)!.technologies,
                    style: const TextStyle(fontSize: 40))),
            Wrap(
              spacing: 20,
              runSpacing: 30,
              children: [
                ColumnListTechnologyWidget(
                  listTechnology: lisTechnologyMobile,
                  isMobile: isMobile,
                  size: size,
                  borderColor: Colors.blue,
                  title: 'Mobile',
                ),
                ColumnListTechnologyWidget(
                  listTechnology: lisTechnologyBackend,
                  isMobile: isMobile,
                  size: size,
                  borderColor: Colors.blue,
                  title: 'Backend',
                ),
                ColumnListTechnologyWidget(
                  listTechnology: lisTechnologyFrontend,
                  isMobile: isMobile,
                  size: size,
                  borderColor: Colors.blue,
                  title: 'Frontend',
                ),
                ColumnListTechnologyWidget(
                  listTechnology: lisTechnologyLearning,
                  isMobile: isMobile,
                  size: size,
                  borderColor: Colors.blue,
                  title: 'Learning',
                ),
                ColumnListTechnologyWidget(
                  listTechnology: listTechnologyTools,
                  isMobile: isMobile,
                  size: size,
                  borderColor: Colors.blue,
                  title: 'Tools',
                ),
              ],
            )
          ],
        ));
  }
}
