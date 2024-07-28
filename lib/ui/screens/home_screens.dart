import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/appLocale/app_locale_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';

import '../widgets/header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double space = size.width > 700 ? size.width * 0.20 : size.width * 0.05;
    return Scaffold(
        appBar: AppBar(
          title: Padding(
              padding: EdgeInsets.only(left: space),
              child: const Text("Software developer")),
          actions: [
            Padding(
                padding: EdgeInsets.only(left: space),
                child: IconButton(
                    onPressed: () {
                      context.read<AppLocaleBloc>().add(ChangeLocalEvent());
                    },
                    icon: Text(
                        context
                            .watch<AppLocaleBloc>()
                            .state
                            .locale
                            .getLenguajeCode(),
                        style: const TextStyle(fontSize: 25)))),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.01, right: space),
              child: IconButton(
                  onPressed: () {
                    context.read<AppThemeBloc>().add(ChangeThemeEvent());
                  },
                  icon: context.watch<AppThemeBloc>().state.appTheme.getIcon()),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.04),
                child: HeaderWidget(size: size),
              )
            ],
          ),
        ));
  }
}
