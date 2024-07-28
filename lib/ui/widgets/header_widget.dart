import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HeaderWidget extends StatelessWidget {
  final Size size;
  const HeaderWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.only(right: size.width * 0.04),
                child: const CircleAvatar(
                  maxRadius: 120,
                  backgroundImage:AssetImage("assets/images/personal.jpeg")

                )),
            Column(
              children: [
                const Text("Alejandro Aguilar",style: TextStyle(fontSize: 40),),
                Row(
                  children: [
                    IconButton(
                        hoverColor: Colors.red.withOpacity(0.4),
                        onPressed: () {},
                        icon: const Icon(Icons.add)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.add))
                  ],
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
