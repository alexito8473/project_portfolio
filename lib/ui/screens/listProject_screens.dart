import 'package:flutter/cupertino.dart';

class ListProjectWidget extends StatelessWidget {
  final Duration durationAnimation;
  final bool isMobile;
  final Size size;
  final double spaceFinal;
  const ListProjectWidget(
      {super.key,
      required this.durationAnimation,
      required this.isMobile,
      required this.size,
      required this.spaceFinal});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.only(top: size.height * 0.05),
      width: spaceFinal,
      duration: durationAnimation,
      child: const Column(
        children: [],
      ),
    );
  }
}
