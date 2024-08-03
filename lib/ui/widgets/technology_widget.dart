import 'package:animate_on_hover/animate_on_hover.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../models/Technology.dart';

class TechnologyView extends StatelessWidget {
  final Size size;
  final Technology technology;
  final bool isMobile;
  const TechnologyView(
      {super.key,
      required this.size,
      required this.technology,
      required this.isMobile});

  void createFrame(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Color background =
            context.watch<AppThemeBloc>().state.appTheme == AppTheme.DARK
                ? Colors.black
                : Colors.white;
        return AlertDialog(
          shadowColor:
              context.watch<AppThemeBloc>().state.appTheme == AppTheme.DARK
                  ? Colors.white10
                  : Colors.black12,
          content: Container(

              padding: const EdgeInsets.all(10),
              width: 350,
              height: isMobile ? 350 : 430,
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
                      bottom: 5,
                      left: 5,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage(technology.urlIcon))),
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Column(children: [
                        Row(
                          children: [
                            Expanded(
                              child: AutoSizeText(
                                maxLines: 2,
                                '${AppLocalizations.of(context)!.myExperience} ${technology.name}',
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.close))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: AutoSizeText(
                            maxLines: 12,
                            technology.description,
                            style: const TextStyle(fontSize: 15),
                            textAlign: TextAlign.justify,
                          ),
                        )
                      ]))
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
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: const [
                0.38,
                0.38,
                0.85,
                0.85
              ],
                  colors: [
                Colors.transparent,
                technology.color.withOpacity(0.8),
                technology.color.withOpacity(0.8),
                Colors.transparent,
              ])),
          width: 260,
          height: 120,
          child:
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 30),
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(technology.urlIcon))),
                  ),
                    AutoSizeText(maxLines: 1,
                    technology.name,
                    style: const TextStyle(fontSize: 22),
                  )
                ],
              ),
        )).increaseSizeOnHover(1.1);
  }
}
