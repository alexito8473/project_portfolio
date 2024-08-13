import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../structure/cubits/listTechnology/list_technology_cubit.dart';
import 'columnListTechnology_Widget.dart';
import 'titleCustom.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LitTechnology extends StatelessWidget {
  final Size size;
  final bool isMobile;
  final bool isDarkMode;
  final Function createDialogTechnology;
  const LitTechnology(
      {super.key,
      required this.size,
      required this.isMobile,
      required this.isDarkMode,
      required this.createDialogTechnology});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListTechnologyCubit, ListTechnologyState>(
      builder: (context, state) {
        AppLocalizations appLocalizations = AppLocalizations.of(context)!;
        BeveledRectangleBorder beveledRectangleBorder = BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: const BorderSide(color: Colors.blue, width: 2),
        );
        return Padding(
          padding: EdgeInsets.only(
              right: size.width * 0.15, left: size.width * 0.15),
          child: Column(children: [
            TitleHome(
              size: size,
              spaceFinal: size.width * 0.7,
              title: AppLocalizations.of(context)!.technologies,
            ),
            RepaintBoundary(
                child: Wrap(
                    spacing: 20,
                    alignment: WrapAlignment.center,
                    runSpacing: 30,
                    children: [
                  ColumnListTechnologyWidget(
                    listTechnology: state.listTechnologyMobile,
                    isMobile: isMobile,
                    size: size,
                    title: appLocalizations.mobile,
                    beveledRectangleBorder: beveledRectangleBorder,
                    createDialogTechnology: createDialogTechnology,
                    isDarkMode: isDarkMode,
                  ),
                  ColumnListTechnologyWidget(
                    listTechnology: state.listTechnologyBackend,
                    isMobile: isMobile,
                    size: size,
                    title: "Backend",
                    beveledRectangleBorder: beveledRectangleBorder,
                    createDialogTechnology: createDialogTechnology,
                    isDarkMode: isDarkMode,
                  ),
                  ColumnListTechnologyWidget(
                    listTechnology: state.listTechnologyFrontend,
                    isMobile: isMobile,
                    size: size,
                    title: "Frontend",
                    beveledRectangleBorder: beveledRectangleBorder,
                    createDialogTechnology: createDialogTechnology,
                    isDarkMode: isDarkMode,
                  ),
                  ColumnListTechnologyWidget(
                    listTechnology: state.listTechnologyServers,
                    isMobile: isMobile,
                    size: size,
                    title: appLocalizations.server,
                    beveledRectangleBorder: beveledRectangleBorder,
                    createDialogTechnology: createDialogTechnology,
                    isDarkMode: isDarkMode,
                  ),
                  ColumnListTechnologyWidget(
                    listTechnology: state.listTechnologyTools,
                    isMobile: isMobile,
                    size: size,
                    title: appLocalizations.tools,
                    beveledRectangleBorder: beveledRectangleBorder,
                    createDialogTechnology: createDialogTechnology,
                    isDarkMode: isDarkMode,
                  ),
                  ColumnListTechnologyWidget(
                    listTechnology: state.listTechnologyLearning,
                    isMobile: isMobile,
                    size: size,
                    title: appLocalizations.learning,
                    beveledRectangleBorder: beveledRectangleBorder,
                    createDialogTechnology: createDialogTechnology,
                    isDarkMode: isDarkMode,
                  )
                ])),
          ]),
        );
      },
    );
  }
}
