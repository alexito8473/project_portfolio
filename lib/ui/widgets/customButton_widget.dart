import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  void downloadFile() {
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

class ButtonContactToMe extends StatefulWidget {
  final bool isDesactivate;
  final Function sendEmail;
  const ButtonContactToMe(
      {super.key, required this.isDesactivate, required this.sendEmail});

  @override
  State<ButtonContactToMe> createState() => _ButtonContactToMeState();
}

class _ButtonContactToMeState extends State<ButtonContactToMe> {
  bool _changeBackground = false;
  double _elevation = 2.0;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = context.watch<AppThemeBloc>().state.isDarkMode();
    return InkWell(
      mouseCursor: widget.isDesactivate
          ? MouseCursor.defer
          : SystemMouseCursors.click,
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
                    ? isDarkMode?Colors.grey.withOpacity(0.2):Colors.grey
                    : _changeBackground
                        ? Colors.lightBlueAccent
                        : Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text("Enviar"),
            ),
          )),
    );
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
