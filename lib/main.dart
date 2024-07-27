import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_porfolio/page/screens/home_screens.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppThemeBloc(),
        child: BlocBuilder<AppThemeBloc, AppThemeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Porfolio Alejandro',
              theme: state.appTheme.getTheme(),
              home: const HomeScreen(),
            );
          },
        ));
  }
}
