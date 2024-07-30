
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/Technology.dart';

class TechnologyView extends StatelessWidget {
  final Size size;
  final Technology technology;
  const TechnologyView(
      {super.key, required this.size, required this.technology});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops:const  [
                0.5,
                0.5,
                0.9,
                0.9
              ],
              colors: [
                Colors.transparent,
                technology.color,
                technology.color,
                Colors.transparent,
              ])),
      width: 320,
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    image: DecorationImage(fit: BoxFit.contain,
                        image: AssetImage(technology.urlIcon)
                    )
                ),
              ),
              Text(
                technology.name,
                style: const TextStyle(fontSize: 30),
              )
            ],
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              child: Tooltip(
               padding: const EdgeInsets.all(10),
                message: "${technology.progress}%",
                child: Padding (
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: LinearProgressIndicator(
                    color: Colors.amber.withOpacity(0.9),
                    value: technology.progress/100,
                  ),
                )
              ) )
        ],
      ),
    );
  }
}
