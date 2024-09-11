import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/Technology.dart';
import '../../structure/cubits/listTechnology/list_technology_cubit.dart';
import '../utils/CheckSize.dart';
import 'columnListTechnology_Widget.dart';
import 'titleCustom.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListTechnology extends StatelessWidget {
  const ListTechnology({super.key});
  void createDialogTechnology(BuildContext context, Technology technology,
      bool isMobile, bool isDarkMode) {
    Color background = isDarkMode ? Colors.black : Colors.white;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shadowColor: isDarkMode ? Colors.white10 : Colors.black12,
          content: Container(
            width: 350,
            height: !isMobile ? 380 : 430,
            decoration: BoxDecoration(
                color: background, borderRadius: BorderRadius.circular(10)),
            child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        transform: const GradientRotation(0.3),
                        stops: const [
                          0.85,
                          0.85,
                          1,
                          1
                        ],
                        colors: [
                          background,
                          technology.color.withOpacity(0.5),
                          technology.color.withOpacity(0.5),
                          background
                        ])),
                child: Column(
                  children: [
                    SizedBox(
                        height: 40,
                        child: Row(
                          children: [
                            Expanded(
                              child: AutoSizeText(
                                maxLines: 2,
                                '${AppLocalizations.of(context)!.myExperience} ${technology.name}',
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.close))
                          ],
                        )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: AutoSizeText(
                        technology.typeDescription.getDescription(context),
                        style: const TextStyle(fontSize: 15),
                        textAlign: TextAlign.justify,
                      ),
                    )),
                    Container(
                        height: 60,
                        alignment: Alignment.bottomLeft,
                        child: SvgPicture.asset(
                          technology.urlIcon,
                          width: 60,
                        )),
                  ],
                )),
          ),
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          elevation: 24.0, // Controla la sombra para el efecto de elevación
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    bool isMobile = CheckSize.isMobile(size);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.15,
          vertical: isMobile ? 0 : size.height * 0.15),
      child: Column(children: [
        TitleHome(
          size: size,
          title: AppLocalizations.of(context)!.knowledge,
          isMobile: isMobile),
         Padding(
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
                            createDialogTechnology: createDialogTechnology)))),
      ]),
    );
  }
}
