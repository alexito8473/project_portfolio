import 'dart:math';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/appLocale/app_locale_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';

import '../../models/CustomParticle.dart';
import '../../models/Technology.dart';
import '../widgets/education_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/listTechnology_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> with TickerProviderStateMixin {
  List<Technology> listTechnology = [
    const Technology(
        name: "Java",
        progress: 80,
        urlIcon: "assets/images/java.png",
        color: Color.fromRGBO(224, 31, 34, 1)),
    const Technology(
        name: "Python",
        progress: 30,
        urlIcon: "assets/images/python.png",
        color: Color.fromRGBO(48, 105, 152, 1)),
    const Technology(
        name: "Dart",
        progress: 70,
        urlIcon: "assets/images/dart.png",
        color: Color.fromRGBO(1, 117, 194, 1)),
    const Technology(
        name: "C#",
        progress: 60,
        urlIcon: "assets/images/c#.png",
        color: Color.fromRGBO(155, 89, 182, 1)),
    const Technology(
        name: "PHP",
        progress: 60,
        urlIcon: "assets/images/php.png",
        color: Color.fromRGBO(97, 124, 190, 1)),
    const Technology(
        name: "Kotlin",
        progress: 75,
        urlIcon: "assets/images/kotlin.png",
        color: Color.fromRGBO(241, 142, 0, 1)),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    bool isMobile = size.width > 700;
    double space = isMobile ? size.width * 0.15 : size.width * 0.05;
    double spaceFinal =
        size.width > 1200 ? size.width * 0.6 : size.width * 0.75;
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black,
          toolbarHeight: 80,
          title: AnimatedPadding(
              duration: const Duration(milliseconds: 500),
              padding: EdgeInsets.only(left: space),
              child: const Text("Software developer")),
          actions: [
            AnimatedPadding(
                duration: const Duration(milliseconds: 500),
                padding: EdgeInsets.only(left: space),
                child: IconButton(
                    onPressed: () {
                      context.read<AppLocaleBloc>().add(ChangeLocalEvent());
                    },
                    icon: Text(
                        context
                            .watch<AppLocaleBloc>()
                            .state
                            .locale
                            .getLenguajeCode(),
                        style: const TextStyle(fontSize: 25)))),
            AnimatedPadding(
              duration: const Duration(milliseconds: 600),
              padding: EdgeInsets.only(left: size.width * 0.01, right: space),
              child: IconButton(
                  onPressed: () {
                    context.read<AppThemeBloc>().add(ChangeThemeEvent());
                  },
                  icon: context.watch<AppThemeBloc>().state.appTheme.getIcon()),
            )
          ],
        ),
        body: SizedBox(
            width: size.width,
            height: size.height,
            child: AnimatedBackground(
                behaviour: CustomParticle().setOptions(context),
                vsync: this,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HeaderWidget(
                        size: size,
                        spaceFinal: spaceFinal,
                        isMobile: isMobile,
                      ),
                      TechnologyWidget(
                        size: size,
                        spaceFinal: spaceFinal,
                        listTechnology: listTechnology,
                      ),
                      EducationWidget(spaceFinal: spaceFinal, size: size,),
                      SizedBox(
                        height: size.height * 0.2,
                      ),
                      SizedBox(
                        height: size.height * 0.2,
                      ),
                      SizedBox(
                        height: size.height * 0.2,
                      ),
                      SizedBox(
                        height: size.height * 0.2,
                      ),
                    ],
                  ),
                ))));
  }
}
