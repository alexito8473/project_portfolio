import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:html' as html;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../structure/blocs/appTheme/app_theme_bloc.dart';

class IconButtonNavigator extends StatelessWidget {
  final Uri uri;
  final Color color;
  final String tooltip;
  final String iconUri;
  final bool secondColor;
  final bool overSideWidth;
  const IconButtonNavigator(
      {super.key,
      required this.uri,
      required this.color,
      required this.tooltip,
      required this.iconUri,
      required this.secondColor,
      required this.overSideWidth});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: const EdgeInsets.all(12),
        iconSize: 50,
        tooltip: tooltip,
        color: color,
        onPressed: () async => await launchUrl(uri),
        icon: SvgPicture.asset(
          iconUri,
          color: secondColor ? color : null,
          width: overSideWidth ? 60 : 40,
        ));
  }
}

class ButtonDownloadPdf extends StatelessWidget {
  final bool overSideWidth;
  const ButtonDownloadPdf({super.key, required this.overSideWidth});

  void downloadFile()  {

    html.AnchorElement(href: 'assets/pdf/Currículum_Alejandro_Aguilar.pdf')
      ..setAttribute('download', "Curriculum_Alejandro_Aguilar.pdf")
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => downloadFile(),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          shadowColor: Colors.blueAccent,
          elevation: 5, // Elevación
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        ),
        child: Text(
          AppLocalizations.of(context)!.downloadCV,
          style: TextStyle(fontSize: overSideWidth ? 25 : 14),
        ));
  }
}

class ButtonGithubProject extends StatelessWidget {
  final Size size;
  final Uri uri;
  const ButtonGithubProject({super.key, required this.size, required this.uri});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10),
        width: 80,
        height: 45,
        child: FloatingActionButton(
            onPressed: () async => await launchUrl(uri),
            child: SvgPicture.asset(
              color: context.watch<AppThemeBloc>().state.isDarkMode()
                  ? Colors.white
                  : Colors.black,
              "assets/svg/github.svg",
              width: 35,
            )));
  }
}
