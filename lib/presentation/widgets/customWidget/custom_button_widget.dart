import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart' deferred as launch;
import 'package:web/web.dart' as web;

import '../../../domain/cubits/appTheme/app_theme_cubit.dart';

class ButtonIconSvg extends StatelessWidget {
  final Uri uri;
  final String tooltip;
  final String iconUri;
  final bool changeColor;

  const ButtonIconSvg(
      {super.key,
      required this.uri,
      required this.tooltip,
      required this.iconUri,
      this.changeColor = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await launch.loadLibrary();
        await launch.launchUrl(uri);
      },
      mouseCursor: SystemMouseCursors.click,
      child: Tooltip(
        message: tooltip,
        child: SvgPicture.asset(iconUri,
            color: changeColor
                ? context.watch<AppThemeCubit>().state.isDarkMode()
                    ? Colors.white
                    : Colors.black
                : null,
            width: 33),
      ),
    );
  }
}

class IconButtonNavigator extends StatelessWidget {
  final Uri uri;
  final Color color;
  final String tooltip;
  final String iconUri;
  final bool changeColor;

  const IconButtonNavigator(
      {super.key,
      required this.uri,
      required this.tooltip,
      required this.iconUri,
      this.changeColor = false,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit,AppThemeState>(builder: (context, state) {
      return  IconButton(
          padding: const EdgeInsets.all(12),
          iconSize: 30,
          tooltip: tooltip,
          color: color,
          onPressed: () async {
            await launch.loadLibrary();
            await launch.launchUrl(uri);
          },
          icon: SvgPicture.asset(iconUri,
              color: changeColor
                  ? state.isDarkMode()
                  ? Colors.white
                  : Colors.black
                  : null,
              width: ResponsiveBreakpoints.of(context).isMobile ? 35 : 50));
    },);
  }
}

class ButtonSelect extends StatelessWidget {
  final Function onPressed;
  final bool isSelect;
  final String title;
  const ButtonSelect(
      {super.key,
      required this.onPressed,
      required this.isSelect,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
              if (isSelect) {
                return Colors.blueAccent.withOpacity(0.8);
              }
              return context.watch<AppThemeCubit>().state.isDarkMode()
                  ? Colors.white70
                  : Colors.grey.shade100;
            }),
            foregroundColor:
                WidgetStateProperty.resolveWith<Color>((Set states) {
              if (states.contains(WidgetState.selected)) {
                return Colors.white;
              }
              return Colors.black87;
            }),
            overlayColor: WidgetStateProperty.resolveWith<Color>(
                (states) => Colors.black12),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
        onPressed: () => onPressed(),
        child: Container(
            alignment: Alignment.center,
            width: 90,
            height: 40,
            child: AutoSizeText(title, maxLines: 1)));
  }
}

class ButtonDownloadPdf extends StatelessWidget {
  const ButtonDownloadPdf({super.key});
  void downloadFile() =>
    web.window.open(kDebugMode?'assets/assets/pdf/Alejandro_Aguilar.pdf':'/Alejandro_Aguilar.pdf', '_blank');

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => downloadFile(),
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            shadowColor: Colors.blueAccent,
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15)),
        child: AutoSizeText(AppLocalizations.of(context)!.downloadCV,
            maxLines: 1, style: Theme.of(context).textTheme.labelLarge));
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
    bool isDarkMode = context.watch<AppThemeCubit>().state.isDarkMode();
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
                    child: Text(AppLocalizations.of(context)!.sendEmail)))));
  }
}

class ButtonNavigation extends StatelessWidget {
  final Uri uri;
  final String urlSvg;
  const ButtonNavigation({super.key, required this.uri, required this.urlSvg});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 80,
        height: 45,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey.shade700.withOpacity(0.7),
                shadowColor: Colors.blueGrey.shade700,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () async {
              await launch.loadLibrary();
              await launch.launchUrl(uri);
            },
            child: SvgPicture.asset(color: Colors.white, urlSvg, width: 35)));
  }
}
