import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';
import '../widgets/customButton_widget.dart';

class HeaderWidget extends StatelessWidget {
  final Size size;
  final bool isMobile;
  const HeaderWidget(
      {super.key,
      required this.size,
      required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top:!isMobile?size.height * 0.07: size.height * 0.04,
                    bottom: size.height * 0.05,
          left: size.width * 0.1,
          right: size.width * .1),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        children: [
          RepaintBoundary(
              child: ClipOval(
            child: Image.asset(
              "assets/images/personal.webp",
              width: isMobile ? 160 : 220,
            ),
          )),
          SizedBox(
              width: 400,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const AutoSizeText(
                      "Alejandro Aguilar",
                      maxLines: 1,
                      style: TextStyle(fontSize: 40),
                    ),
                    RepaintBoundary(
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          IconButtonNavigator(
                            uri: Uri.parse('https://github.com/alexito8473'),
                            color: context.watch<AppThemeBloc>().state.isDarkMode() ? Colors.white : Colors.black,
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
                          )
                        ]))
                  ])),
          Container(
              margin: EdgeInsets.only(
                  top: size.height * 0.08, bottom: size.height * 0.02),
              width: size.width * 0.70,
              child: Wrap(
                  spacing: 10,
                  runSpacing: 20,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.spaceBetween,
                  runAlignment: WrapAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.aboutMe,
                      style: const TextStyle(fontSize: 40),
                    ),
                    const ButtonDownloadPdf()
                  ])),
          AnimatedContainer(
            padding: EdgeInsets.only(bottom: size.height*.06,top: size.height*.03),
              width: size.width * 0.7,
              duration: const Duration(milliseconds: 300),
              child: Text(
                AppLocalizations.of(context)!.aboutMeDescription,
                style: TextStyle(
                    fontSize: isMobile ? 18 : 20, fontStyle: FontStyle.italic),
                textAlign: TextAlign.justify,
              )),
                  ],
      ),
    );
  }
}
