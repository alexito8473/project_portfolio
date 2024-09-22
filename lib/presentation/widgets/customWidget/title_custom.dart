import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TitleHome extends StatelessWidget {
  final String title;
  final Widget subIcon;

  const TitleHome({super.key, required this.title, required this.subIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 50),
        width: ResponsiveBreakpoints.of(context).isMobile
            ? ResponsiveBreakpoints.of(context).screenWidth * 0.8
            : ResponsiveBreakpoints.of(context).screenWidth * 0.7,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            subIcon,
            const SizedBox(width: 10),
            Expanded(child:  AutoSizeText(title,
                style: TextStyle(
                    fontSize:
                    ResponsiveBreakpoints.of(context).isMobile ? 30 : 30),
                maxLines: 1))

          ],
        ));
  }
}
