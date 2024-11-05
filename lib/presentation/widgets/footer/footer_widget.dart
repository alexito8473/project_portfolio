import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child:Container(
      color: Colors.grey.shade700,
      margin: const EdgeInsets.only(top: 80),
      height: 80,
      width: ResponsiveBreakpoints.of(context).screenWidth,
      alignment: Alignment.center,
      child: const Text(
        "©2024 Alejandro Aguilar",
        style: TextStyle(fontSize: 25),
      ),
    ));
  }
}
