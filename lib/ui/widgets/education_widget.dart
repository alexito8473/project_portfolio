import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lecle_bubble_timeline/lecle_bubble_timeline.dart';
import 'package:lecle_bubble_timeline/models/timeline_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class EducationWidget extends StatelessWidget {
  final double spaceFinal;
  final Size size;
  const EducationWidget({super.key, required this.spaceFinal, required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top:  size.height * 0.05),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: spaceFinal,
              child: Text(
                AppLocalizations.of(context)!.workExperience,
                style: const TextStyle(fontSize: 40),
              ),
            ),
              BubbleTimeline(
              bubbleSize: 150,
              items: [
                TimelineItem(
                  title:AppLocalizations.of(context)!.comingSoon ,
                  icon: const Icon(
                    Icons.computer,
                    color: Colors.black,
                    size: 50,
                  ),
                  bubbleColor: Colors.red,
                  titleStyle:const  TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),
                  subtitleStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                TimelineItem(
                  title: ' NextPort AI',
                  subtitle: AppLocalizations.of(context)!.practices,
                  icon: const Icon(
                    Icons.directions_boat,
                    color: Colors.black,
                    size: 50,
                  ),
                  bubbleColor: Colors.green,
                  titleStyle: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),
                  subtitleStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
              ],
              stripColor: Colors.teal,
              dividerCircleColor: Colors.white,
            )
          ],
        ));
  }
}
