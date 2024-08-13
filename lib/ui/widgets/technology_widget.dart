import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../models/Technology.dart';

class TechnologyView extends StatelessWidget {
  final Size size;
  final Technology technology;
  final bool isMobile;
  final bool isDarkMode;
  final Function createFrame;
  const TechnologyView({
    super.key,
    required this.size,
    required this.technology,
    required this.isMobile,
    required this.createFrame,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => createFrame(context, technology, isMobile, isDarkMode),
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: const [
                0.40,
                0.40,
                0.85,
                0.85
              ],
                  colors: [
                Colors.transparent,
                technology.color,
                technology.color,
                Colors.transparent,
              ])),
          width: 280,
          height: 120,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 45),
                child: SvgPicture.asset(
                  technology.urlIcon,
                  color: technology.changeColor
                      ? isDarkMode
                          ? Colors.white
                          : Colors.black
                      : null,
                  width: 60,
                ),
              ),
              AutoSizeText(
                maxLines: 1,
                technology.name,
                style: const TextStyle(fontSize: 20),
              )
            ],
          ),
        ));
  }
}
