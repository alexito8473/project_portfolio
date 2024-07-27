import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alejandro"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          IconButton(
              onPressed: () {
                context.read<AppThemeBloc>().add(ChangeThemeEvent());
              },
              icon: context.watch<AppThemeBloc>().state.appTheme.getIcon()),
        ],
      ),
      body: Center(
        child: Text(
          "Holaasdhajhasdf",
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
