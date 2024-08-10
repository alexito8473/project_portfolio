import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

import 'package:url_launcher/url_launcher_string.dart';

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

  void downloadFile() async {
    const url = 'assets/pdf/Currículum_Alejandro_Aguilar.pdf';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    }
      html.AnchorElement(href: url)
        ..setAttribute('download', "Curriculum_Alejandro_Aguilar.pdf")
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
        child: Text(
          AppLocalizations.of(context)!.downloadCV,
          style: const TextStyle(fontSize: 16),
        ));
  }
}
