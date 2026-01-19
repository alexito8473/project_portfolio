import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/cubits/appTheme/app_theme_cubit.dart';
import '../../l10n/app_localizations.dart' deferred as locations;
import 'package:animated_background/animated_background.dart'
deferred as background_animated;

import '../../presentation/pages/certificate_page.dart' deferred as certificate_page;
import '../../presentation/pages/home_page.dart' deferred as home_page;
import '../../presentation/pages/list_project_page.dart' deferred as list_project_page;
import '../../presentation/pages/project_page.dart' deferred as project_page;
import '../screens/home_screens.dart' deferred as home;
import '../../data/dataSource/menu_items.dart' deferred as menu_items;
import '../../data/dataSource/project_data.dart' deferred as project;
import '../../data/dataSource/certificate_data.dart' deferred as certificate_data;
import '../../data/dataSource/tecnology_data.dart' deferred as tecnology_data;
import '../../data/dataSource/work_data.dart' deferred as work_data;
import '../../data/models/item.dart' deferred as item_data;
import '../../data/models/message.dart' deferred as message_data;
import '../../data/models/project.dart' deferred as project_data;
import '../../data/models/technology.dart' deferred as technology_data;
import '../../data/models/work.dart' deferred as work_data_data;
import '../../domain/cubits/appBannerTop/app_banner_top_cubit.dart' deferred as banner_cubit;
import '../../domain/cubits/listTechnology/list_technology_cubit.dart' deferred as list_cubit;
import '../widgets/certificate/type_carrousel_certificate_widget.dart'
deferred as certificate;
import '../widgets/contact/contact_me_widget.dart' deferred as contact_me;
import '../widgets/customWidget/title_custom.dart' deferred as title;
import '../widgets/footer/footer_widget.dart' deferred as footer;
import '../widgets/aboutMe/about_me_widget.dart' deferred as about_me;
import '../widgets/header/header_widegt.dart' deferred as header;
import '../widgets/project/project_widget.dart' deferred as projects;
import '../widgets/technology/list_technology_widget.dart'
deferred as list_technology;
import '../widgets/work/list_works_widget.dart' deferred as list_work;
import '../../my_app.dart' deferred as my_app;
import 'package:web/web.dart' as web;

class SplashPage extends StatefulWidget {
  final void Function(Widget app) active;
  const SplashPage(
      {super.key,  required this.active});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  Future<void> _initializePage() async {
    await Future.wait([
      background_animated.loadLibrary(),
      home.loadLibrary(),
      list_work.loadLibrary(),
      list_technology.loadLibrary(),
      projects.loadLibrary(),
      header.loadLibrary(),
      about_me.loadLibrary(),
      footer.loadLibrary(),
      locations.loadLibrary(),
      contact_me.loadLibrary(),
      title.loadLibrary(),
      certificate.loadLibrary(),
      menu_items.loadLibrary(),
      project.loadLibrary(),
      certificate_page.loadLibrary(),
      home_page.loadLibrary(),
      list_project_page.loadLibrary(),
      project_page.loadLibrary(),
      certificate_data.loadLibrary(),
      tecnology_data.loadLibrary(),
      work_data.loadLibrary(),
      item_data.loadLibrary(),
      message_data.loadLibrary(),
      project_data.loadLibrary(),
      technology_data.loadLibrary(),
      work_data_data.loadLibrary(),
      banner_cubit.loadLibrary(),
      list_cubit.loadLibrary()
    ]).whenComplete(() async {
      await my_app.loadLibrary();
      var results = await Future.wait(
          [dotenv.load(fileName: ".env"),
            SharedPreferences.getInstance()]);
      widget.active(my_app.MyApp(prefs:results[1] as SharedPreferences));
    },);
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
                  title: 'Portafolio de Alejandro Aguilar Alba | Desarrollador Full Stack & Mobile',
                  theme: AppTheme.DARK.getThemeData(),
                  home: FutureBuilder<void>(
                    future: _initializePage(),
                    builder: (context, snapshot) {
                      final theme = Theme.of(context);
                      return Material(
                        child: Center(
                          child: Center(
                            child: AnimatedOpacity(
                              opacity: 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeOut,
                              child: AnimatedScale(
                                scale: 1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeOut,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Alejandro Aguilar Alba',
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.titleLarge
                                          ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.1,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      'Full Stack & Mobile Developer',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                        color: theme.colorScheme.primary,
                                      ),
                                    ),
                                    Text(
                                      '@ Flutter',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                        color: theme.colorScheme.primary,
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    const SizedBox(
                                      width: 120,
                                      child: LinearProgressIndicator(
                                          minHeight: 2),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ));
  }
}
