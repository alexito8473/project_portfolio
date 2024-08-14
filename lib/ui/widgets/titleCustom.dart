import 'package:flutter/material.dart';

class TitleHome extends StatelessWidget {
  final Size size;
  final String title;
  final bool isMobile;
  const TitleHome(
      {super.key,
      required this.size,
      required this.title, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top: isMobile?0:size.height * 0.05, bottom: size.height * 0.05),
        width: size.width * 0.70,
        child: Text(title, style: const TextStyle(fontSize: 40)));
  }
}
