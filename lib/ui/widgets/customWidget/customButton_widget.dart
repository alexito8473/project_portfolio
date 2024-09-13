import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:html' as html;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../structure/blocs/appTheme/app_theme_bloc.dart';

class ButtonIconSvg extends StatelessWidget {
  final Uri uri;
  final Color color;
  final String tooltip;
  final String iconUri;
  final bool secondColor;
  const ButtonIconSvg(
      {super.key,
      required this.uri,
      required this.color,
      required this.tooltip,
      required this.iconUri,
      required this.secondColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async => await launchUrl(uri),
      mouseCursor: SystemMouseCursors.click,
      child: Tooltip(
        message: tooltip ,
        child:  SvgPicture.asset(iconUri,
              color: secondColor ? color : null,
              width:  35),

      ) ,
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
        iconSize: 30,
        tooltip: tooltip,
        color: color,
        onPressed: () async => await launchUrl(uri),
        icon: SvgPicture.asset(iconUri,
            color: secondColor ? color : null,
            width: ResponsiveBreakpoints.of(context).isMobile ? 35 : 50));
  }
}

class ButtonDownloadPdf extends StatelessWidget {
  const ButtonDownloadPdf({super.key});

  void downloadFile() async {
    // Cargar el archivo PDF desde los assets
    ByteData data = await rootBundle
        .load('assets/pdf/Curriculum_Alejandro_Aguilar_Alba.pdf');
    final pdfBytes = data.buffer.asUint8List();

    // Crear el blob para descarga
    final blob = html.Blob([pdfBytes], 'application/pdf');

    // Crear la URL para descarga
    final url = html.Url.createObjectUrlFromBlob(blob);
    html.AnchorElement(href: url)
      ..setAttribute('download',
          'Curriculum_Alejandro_Aguilar_Alba.pdf') // Nombre del archivo a descargar
      ..click();

    // Liberar el URL temporal
    html.Url.revokeObjectUrl(url);
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        ),
        child: Text(AppLocalizations.of(context)!.downloadCV,
            style: TextStyle(
                fontSize:
                    ResponsiveBreakpoints.of(context).isMobile ? 14 : 18)));
  }
}

class ButtonSentEmail extends StatefulWidget {
  final bool isDesactivate;
  final Function sendEmail;
  const ButtonSentEmail(
      {super.key, required this.isDesactivate, required this.sendEmail});

  @override
  State<ButtonSentEmail> createState() => _ButtonSentEmailState();
}

class _ButtonSentEmailState extends State<ButtonSentEmail> {
  bool _changeBackground = false;
  double _elevation = 2.0;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = context.watch<AppThemeBloc>().state.isDarkMode();
    return InkWell(
      mouseCursor:
          widget.isDesactivate ? MouseCursor.defer : SystemMouseCursors.click,
      onTap: () {
        if (!widget.isDesactivate) {
          widget.sendEmail();
        }
      },
      child: MouseRegion(
          onEnter: (event) {
            if (!widget.isDesactivate) {
              setState(() {
                _changeBackground = true;
                _elevation = 5;
              });
            }
          },
          onExit: (event) {
            if (!widget.isDesactivate) {
              setState(() {
                _changeBackground = false;
                _elevation = 2;
              });
            }
          },
          child: Material(
            elevation: _elevation,
            borderRadius: BorderRadius.circular(10),
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 120,
                height: 40,
                decoration: BoxDecoration(
                    color: widget.isDesactivate
                        ? isDarkMode
                            ? Colors.grey.withOpacity(0.2)
                            : Colors.grey
                        : _changeBackground
                            ? Colors.lightBlueAccent
                            : Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.center,
                child: Text(AppLocalizations.of(context)!.sendEmail)),
          )),
    );
  }
}

class ButtonGithubProject extends StatelessWidget {
  final Uri uri;
  const ButtonGithubProject({super.key, required this.uri});

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
                width: 35)));
  }
}
