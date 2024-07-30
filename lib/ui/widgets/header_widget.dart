import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

class HeaderWidget extends StatelessWidget {
  final Size size;
  const HeaderWidget({super.key, required this.size});

  void downloadFile(String url, String filename) {
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', filename)
      ..click();
  }

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
                    backgroundImage:
                        AssetImage("assets/images/personal.jpeg"))),
            Column(
              children: [
                const Text(
                  "Alejandro Aguilar",
                  style: TextStyle(fontSize: 40),
                ),
                Row(
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
            )
          ],
        ),
        Container(
            margin: EdgeInsets.only(top: size.height * 0.02),
            width: size.width * 0.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width * 0.2,
                  child: Text(
                    AppLocalizations.of(context)!.aboutMe,
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                const ButtonDownloadPdf()
              ],
            )),
        Container(
          margin: EdgeInsets.only(top: size.height * 0.02),
          width: size.width * 0.4,
          child: Text(
            AppLocalizations.of(context)!.aboutMeDescription,
            style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            textAlign: TextAlign.justify,
          ),
        )
      ],
    );
  }
}

class IconButtonNavigator extends StatelessWidget {
  final Uri uri;
  final Color color;
  final String tooltip;
  final String iconUri;
  final bool secondColor;
  const IconButtonNavigator(
      {super.key,
      required this.uri,
      required this.color,
      required this.tooltip,
      required this.iconUri,
      required this.secondColor});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: const EdgeInsets.all(12),
        iconSize: 50,
        tooltip: tooltip,
        color: color,
        onPressed: () async => await launchUrl(uri),
        icon: SvgIcon(
            color: secondColor ? color : null,
            icon: SvgIconData(iconUri,
                colorSource: SvgColorSource.specialColors)));
  }
}

class ButtonDownloadPdf extends StatelessWidget {
  const ButtonDownloadPdf({super.key});
  void downloadFile() {
    html.AnchorElement(href: "assets/pdf/Currículum_Alejandro_Aguilar.pdf")
      ..setAttribute('download', "Curriculum_Alejandro_Aguilar")
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => downloadFile(),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue, // Color del texto
          shadowColor: Colors.blueAccent, // Color de la sombra
          elevation: 5, // Elevación
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // Forma del botón
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 30, vertical: 15), // Padding
        ),
        child: Text(AppLocalizations.of(context)!.downloadCV,
          style: const TextStyle(fontSize: 16),
        ));
  }
}
