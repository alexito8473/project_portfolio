import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.sizeOf(context);
    return SliverToBoxAdapter(
        child: Container(
            color: Colors.grey.shade700,
            margin: const EdgeInsets.only(top: 80),
            height: 80,
            width: size.width,
            alignment: Alignment.center,
            child: const Text("©2026 Alejandro Aguilar",
                style: TextStyle(fontSize: 25))));
  }
}
