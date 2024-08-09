import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';

import '../widgets/customButtom_widget.dart';

class HeaderWidget extends StatelessWidget {
  final Size size;
  final bool isMobile;
  final Duration durationAnimation;
  const HeaderWidget(
      {super.key,
      required this.size,
      required this.isMobile,
      required this.durationAnimation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: size.height * 0.04,
          bottom: size.height * 0.04,
          left: size.width * 0.1,
          right: size.width * .1),
      child: isMobile
          ? Column(
              children: [
                const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 125,
                    backgroundImage: AssetImage("assets/images/personal.jpeg")),
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
                                  uri: Uri.parse(
                                      'https://github.com/alexito8473'),
                                  color: context
                                              .watch<AppThemeBloc>()
                                              .state
                                              .appTheme ==
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
                                )
                              ])
                        ]))
              ],
            )
          : Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              alignment: WrapAlignment.center,
              children: [
                const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 125,
                    backgroundImage: AssetImage("assets/images/personal.jpeg")),
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
                                  uri: Uri.parse(
                                      'https://github.com/alexito8473'),
                                  color: context
                                              .watch<AppThemeBloc>()
                                              .state
                                              .appTheme ==
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
                                )
                              ])
                        ]))
              ],
            ),
    );
  }
}
