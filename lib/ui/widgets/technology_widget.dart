import 'package:animate_on_hover/animate_on_hover.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';

import '../../models/Technology.dart';

class TechnologyView extends StatelessWidget {
  final Size size;
  final Technology technology;
  const TechnologyView(
      {super.key, required this.size, required this.technology});

  void createFrame(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Color background =
            context.watch<AppThemeBloc>().state.appTheme == AppTheme.DARK
                ? Colors.black
                : Colors.white;
        return AlertDialog(
          shadowColor:context.watch<AppThemeBloc>().state.appTheme == AppTheme.DARK
              ?Colors.white10
              : Colors.black12 ,
          content: Container(
              padding: const EdgeInsets.all(10),
              width: 400,
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.bottomRight,
                      stops: const [
                        0.6,
                        0.6,
                        0.95,
                        0.95
                      ],
                      colors: [
                        background,
                        technology.color,
                        technology.color,
                        background,
                      ])),
              child: Stack(
                children: [
                  Positioned(
                      bottom: 10,
                      left: 10,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage(technology.urlIcon))),
                      )),
                  Column(children: [
                    Text(
                      ' Mi Experiencia usando ${technology.name}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(technology.description)
                  ])
                ],
              )),
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          elevation: 24.0, // Controla la sombra para el efecto de elevación
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => createFrame(context),
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: const [
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
          width: 300,
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
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(technology.urlIcon))),
                  ),
                  Text(
                    technology.name,
                    style: const TextStyle(fontSize: 26),
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: Tooltip(
                      padding: const EdgeInsets.all(10),
                      message: "${technology.progress}%",
                      child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                strokeAlign: 0,
                                color: Colors.transparent, // Color del borde
                                width: 3.0, // Ancho del borde
                              ),
                              borderRadius: BorderRadius.circular(
                                  5.0), // Radio del borde (opcional)
                            ),
                            child: LinearProgressIndicator(
                              backgroundColor: context
                                          .watch<AppThemeBloc>()
                                          .state
                                          .appTheme ==
                                      AppTheme.DARK
                                  ? Colors.white.withOpacity(0.8)
                                  : Colors.grey.withOpacity(0.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              color: Colors.deepOrangeAccent.withOpacity(0.9),
                              value: technology.progress / 100,
                            ),
                          ))))
            ],
          ),
        )).increaseSizeOnHover(1.1);
  }
}
