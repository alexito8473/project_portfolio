import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TitleHome extends StatelessWidget {
  final Size size;
  final String title;
  final bool isMobile;
  const TitleHome(
      {super.key,
      required this.size,
      required this.title,
      required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top:  size.height * 0.05, bottom: size.height *(isMobile? 0.05:0)),
        width: size.width * 0.70,
        child: AutoSizeText(title, style:  TextStyle(fontSize: isMobile?30:45),maxLines: 1,));
  }
}
