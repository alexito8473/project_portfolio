import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/Technology.dart';
import '../../structure/cubits/listTechnology/list_technology_cubit.dart';
import 'columnListTechnology_Widget.dart';
import 'titleCustom.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LitTechnology extends StatelessWidget {
  final Size size;
  final bool isMobile;

  final Function createDialogTechnology;
  const LitTechnology(
      {super.key,
      required this.size,
      required this.isMobile,
      required this.createDialogTechnology});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.15,
          vertical: isMobile ? 0 : size.height * 0.15),
      child: Column(children: [
        TitleHome(
          size: size,
          title: AppLocalizations.of(context)!.knowledge,
          isMobile: isMobile,
        ),
        RepaintBoundary(
            child: Padding(
                padding: EdgeInsets.only(top: isMobile ? 0 : 100),
                child: Wrap(
                    spacing: 20,
                    alignment: WrapAlignment.center,
                    runSpacing: 30,
                    children: List.generate(
                        TypeLanguage.values.length,
                        (index) => ColumnListTechnologyWidget(
                            listTechnology: context
                                .read<ListTechnologyCubit>()
                                .getTypeLanguageList(
                                    TypeLanguage.values[index]),
                            isMobile: isMobile,
                            size: size,
                            title: TypeLanguage.values[index].getTitle(context),
                            createDialogTechnology: createDialogTechnology))))),
      ]),
    );
  }
}
