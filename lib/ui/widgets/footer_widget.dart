
import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.grey.shade700,
      margin: const EdgeInsets.only(top: 80),
      height: 80,
      width: MediaQuery.sizeOf(context).width,
      alignment: Alignment.center,
      child: const Text("©2024 Alejandro Aguilar",style: TextStyle(fontSize: 25),),
    );
  }
}
