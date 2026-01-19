import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:proyect_porfolio/presentation/utils/calculate_size.dart';
import '../../../data/dataSource/menu_items.dart';
import '../../../l10n/app_localizations.dart';

class TitleHome extends StatelessWidget {
  final String title;
  final Widget subIcon;
  final bool haveWidth;
  const TitleHome(
      {super.key,
      required this.title,
      required this.subIcon,
      this.haveWidth = true});


  double? width(Size size) {
    if (!haveWidth) return 200;
    return CalculateSize.isMobile(size)
        ? size.width * 0.8
        : size.width * 0.7;
  }

  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.sizeOf(context);
    return Container(
        margin: const EdgeInsets.only(bottom: 50),
        width: width(size),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            subIcon,
            const SizedBox(width: 10),
            Expanded(
                child: AutoSizeText(title,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize:CalculateSize.isMobile(size)
                            ? 30
                            : 30),
                    maxLines: 1))
          ],
        ));
  }
}

class SliverTitleHome extends StatelessWidget {
  final MenuItems menuItem;
  final double sizeIcon;
  final bool haveWidth;

  const SliverTitleHome(
      {super.key,
      this.haveWidth = true,
      required this.menuItem,
      this.sizeIcon = 40});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final Size size =
        MediaQuery.sizeOf(context);
    return SliverToBoxAdapter(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal:
            size.width * 0.15),
            child: TitleHome(
                title: menuItem.getTitle(locale),
                subIcon: menuItem.getIcon(size: sizeIcon),
                haveWidth: haveWidth)));
  }
}
