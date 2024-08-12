import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lecle_bubble_timeline/lecle_bubble_timeline.dart';
import 'package:lecle_bubble_timeline/models/timeline_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'titleCustom.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EducationWidget extends StatelessWidget {
  final Size size;
  final bool isMobile;
  const EducationWidget(
      {super.key, required this.size, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    double iconSize = isMobile ? 35 : 50;
    return Padding(
        padding: EdgeInsets.only(
            top: size.height * 0.05, bottom: size.height * 0.05),
        child: Column(
          children: [
            TitleHome(
              size: size,
              spaceFinal: size.width * 0.70,
              title: AppLocalizations.of(context)!.workExperience,
            ),
            BubbleTimeline(
              bubbleSize: !isMobile ? 150 : 100,
              items: [
                TimelineItem(
                  title: AppLocalizations.of(context)!.comingSoon,
                  icon: Icon(
                    Icons.computer,
                    color: Colors.black,
                    size: iconSize,
                  ),
                  bubbleColor: Colors.red,
                  titleStyle: TextStyle(
                      fontSize: !isMobile ? 25.0 : 17.0,
                      fontWeight: FontWeight.w700),
                ),
                TimelineItem(
                  title: 'NextPort AI',
                  subtitle: AppLocalizations.of(context)!.practices,
                  icon: Icon(
                    Icons.directions_boat,
                    color: Colors.black,
                    size: iconSize,
                  ),
                  bubbleColor: Colors.green,
                  titleStyle: TextStyle(
                      fontSize: !isMobile ? 25.0 : 17.0,
                      fontWeight: FontWeight.w700),
                  subtitleStyle: TextStyle(
                      fontSize: !isMobile ? 16.0 : 10.0,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                ),
              ],
              stripColor: Colors.teal,
              dividerCircleColor: Colors.white,
            )
          ],
        ));
  }
}
