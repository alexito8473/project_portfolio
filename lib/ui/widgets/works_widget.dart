import 'package:animate_on_hover/animate_on_hover.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lecle_bubble_timeline/lecle_bubble_timeline.dart';
import 'package:lecle_bubble_timeline/models/timeline_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EducationWidget extends StatelessWidget {
  final double spaceFinal;
  final Size size;
  final bool isMobile;
  const EducationWidget(
      {super.key,
      required this.spaceFinal,
      required this.size,
      required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: size.height * 0.05,bottom: size.height * 0.05),
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
              bubbleSize: isMobile ? 150 : 120,
              items: [
                TimelineItem(
                  title: AppLocalizations.of(context)!.comingSoon,
                  icon: const Icon(
                    Icons.computer,
                    color: Colors.black,
                    size: 50,
                  ),
                  bubbleColor: Colors.red,
                  titleStyle: TextStyle(
                      fontSize: isMobile ? 25.0 : 17.0,
                      fontWeight: FontWeight.w700),
                  subtitleStyle: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                TimelineItem(
                  title: 'NextPort AI',
                  subtitle: AppLocalizations.of(context)!.practices,
                  icon: InkWell(
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const AlertDialog(
                            content:  Stack(
                                  children: [
                                    Column(children: [
                                      Text(
                                        ' Mi Experiencia usando ',
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      Text("technology.description")
                                    ])
                                  ],
                                ),
                           // Controla la sombra para el efecto de elevación
                          );
                        },
                      );
                    },
                      child: const Icon(
                    Icons.directions_boat,
                    color: Colors.black,
                    size: 50,
                  )).increaseSizeOnHover(1.2),
                  bubbleColor: Colors.green,
                  titleStyle: TextStyle(
                      fontSize: isMobile ? 25.0 : 19.0,
                      fontWeight: FontWeight.w700),
                  subtitleStyle: TextStyle(
                      fontSize: isMobile ? 16.0 : 12.0,
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
