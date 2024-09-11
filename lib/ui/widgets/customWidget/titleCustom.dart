import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TitleHome extends StatelessWidget {
  final String title;
  const TitleHome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top: ResponsiveBreakpoints.of(context).screenHeight * 0.05,
            bottom: ResponsiveBreakpoints.of(context).screenHeight *
                (ResponsiveBreakpoints.of(context).isMobile ? 0.05 : 0)),
        width: ResponsiveBreakpoints.of(context).screenWidth * 0.70,
        child: AutoSizeText(
          title,
          style: TextStyle(fontSize: ResponsiveBreakpoints.of(context).isMobile ? 30 : 45),
          maxLines: 1,
        ));
  }
}
