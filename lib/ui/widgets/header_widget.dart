import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';

import 'customButtom_widget.dart';

class HeaderWidget extends StatelessWidget {
  final Size size;
  final double spaceFinal;
  final bool isMobile;
  const HeaderWidget({super.key, required this.size, required this.spaceFinal, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: size.height * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              direction:!isMobile?Axis.vertical:Axis.horizontal,
              alignment: WrapAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.transparent,
                        maxRadius: 120,
                        backgroundImage:
                            AssetImage("assets/images/personal.jpeg")),
                SizedBox(
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Alejandro Aguilar",
                        style: TextStyle(fontSize: 40),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButtonNavigator(
                            uri: Uri.parse('https://github.com/alexito8473'),
                            color: context.watch<AppThemeBloc>().state.appTheme ==
                                AppTheme.LIGHT
                                ? Colors.black
                                : Colors.white,
                            tooltip: 'Github',
                            iconUri: 'assets/svg/github.svg',
                            secondColor: true,
                          ),
                          IconButtonNavigator(
                            uri: Uri.parse(
                                'https://www.linkedin.com/in/alejandro-aguilar-83b0b6220/'),
                            color: Colors.blue,
                            tooltip: 'Linkedin',
                            iconUri: 'assets/svg/linkedin.svg',
                            secondColor: false,
                          ),
                        ],
                      )
                    ],
                  ),
                )

              ],
            ),
            AnimatedContainer(
              duration:  const Duration(milliseconds: 500),
                margin: EdgeInsets.only(top: size.height * 0.02),
                width: spaceFinal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                        AppLocalizations.of(context)!.aboutMe,
                        style: const TextStyle(fontSize: 40),
                    ),
                    const ButtonDownloadPdf()
                  ],
                )),
            AnimatedContainer(
              duration:  Duration(milliseconds: 500),
              margin: EdgeInsets.only(top: size.height * 0.02),
              width: spaceFinal,
              child: Text(
                AppLocalizations.of(context)!.aboutMeDescription,
                style:
                    const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ));
  }
}
