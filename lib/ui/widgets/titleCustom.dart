import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TitleHome extends StatelessWidget {
  final Size size;
  final double spaceFinal;
  final String title;
  const TitleHome(
      {super.key,
      required this.size,
      required this.spaceFinal,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: size.height * 0.05,bottom: size.height * 0.05 ),
        width: spaceFinal,
        child: Text(title, style: const TextStyle(fontSize: 40)));
  }
}
