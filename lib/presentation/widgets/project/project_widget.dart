import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:masonry_grid/masonry_grid.dart';
import 'package:proyect_porfolio/domain/cubits/appTheme/app_theme_cubit.dart';
import 'package:proyect_porfolio/presentation/widgets/customWidget/title_custom.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../data/dataSource/menu_items.dart';
import '../../../data/dataSource/project_data.dart';
import '../customWidget/custom_button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TopBannerListProjectWidget extends StatelessWidget {
  const TopBannerListProjectWidget({super.key});
  @override
  Widget build(BuildContext context) {
    ResponsiveBreakpointsData data = ResponsiveBreakpoints.of(context);
    return SliverToBoxAdapter(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: data.screenWidth * .15),
            child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  TitleHome(
                      title: MenuItems.PROJECT.getTitle(context),
                      subIcon: MenuItems.PROJECT.getIcon(size: 40),
                      haveWidth: false),
                  Padding(
                      padding:
                          EdgeInsets.only(bottom: data.screenHeight * 0.05),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.green,
                              shadowColor: Colors.greenAccent,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15)),
                          onPressed: () => context.go("/projects"),
                          child: AutoSizeText(
                              AppLocalizations.of(context)!.see_project,
                              style: Theme.of(context).textTheme.labelLarge,
                              maxLines: 1)))
                ])));
  }
}

class MasonrySliver extends StatelessWidget {
  const MasonrySliver({super.key});

  int countColumns({required BuildContext context}) {
    if (ResponsiveBreakpoints.of(context).screenWidth < 770) return 1;
    if (ResponsiveBreakpoints.of(context).screenWidth < 1300) return 2;
    if (ResponsiveBreakpoints.of(context).screenWidth < 2000) return 3;
    if (ResponsiveBreakpoints.of(context).isDesktop) return 4;
    return 1;
  }

  double viewportFraction({required BuildContext context}) =>
      ResponsiveBreakpoints.of(context).isTablet
          ? 0.55
          : ResponsiveBreakpoints.of(context).isMobile
              ? 0.75
              : 0.32;

  double aspectRatio({required BuildContext context}) =>
      ResponsiveBreakpoints.of(context).isTablet
          ? 1.6
          : ResponsiveBreakpoints.of(context).isMobile
              ? 0.8
              : 2.2;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    int countColum = countColumns(context: context);
    return SliverToBoxAdapter(
        child: Container(
            constraints: BoxConstraints(minHeight: size.height * 1),
            padding: EdgeInsets.symmetric(horizontal: size.width * .1),
            alignment: Alignment.center,
            child: MasonryGrid(
                crossAxisAlignment: CrossAxisAlignment.center,
                column: countColum,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: List.generate(
                    countColum > 3 ? countColum : 3,
                    (index) => Padding(
                        padding: index < countColum
                            ? EdgeInsets.only(
                                top: index == 0 ? 0 : (index % 2 + 0.5) * 70)
                            : EdgeInsets.zero,
                        child: BannerPro(
                            projectRelease: ProjectRelease.values[index]))))));
  }
}

class BannerPro extends StatefulWidget {
  final ProjectRelease projectRelease;
  final double height;

  const BannerPro({super.key, required this.projectRelease, this.height = 570});

  @override
  State<BannerPro> createState() => _BannerProState();
}

class _BannerProState extends State<BannerPro>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final ValueNotifier<bool> _isHover = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _animation = Tween<double>(begin: 0.7, end: 0.0).animate(CurvedAnimation(
        reverseCurve: Curves.linear,
        parent: _controller,
        curve: Curves.linear));
  }

  Widget bannerTitle() {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            maxLines: 1,
            widget.projectRelease.project.name,
            style: const TextStyle(
                fontSize: 25,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              if (widget.projectRelease.project.urlPage != null)
                ButtonNavigation(
                    uri: Uri.parse(widget.projectRelease.project.urlPage!),
                    urlSvg: "assets/svg/web.svg"),
              if (widget.projectRelease.project.urlPage != null)
                const SizedBox(width: 5),
              ButtonNavigation(
                  uri: Uri.parse(widget.projectRelease.project.repositoryUrl),
                  urlSvg: "assets/svg/github.svg"),
            ],
          )
        ],
      ),
    );
  }

  Widget contentTitle() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: AutoSizeText(
          widget.projectRelease.getDescription(context),
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  Widget animatedTop() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 700),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          gradient: LinearGradient(
              begin: _isHover.value ? Alignment.topRight : Alignment.topLeft,
              end: _isHover.value ? Alignment.centerLeft : Alignment.centerRight,
              colors: widget.projectRelease.listBackgroundNoActive())),
      alignment: Alignment.bottomRight,
      height: 250,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(40)),
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Image(
              image: AssetImage(widget.projectRelease.project.imgUrl),
              colorBlendMode: BlendMode.darken,
              color: Colors.black.withOpacity(_animation.value),
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (frame == null) {
                  return const CircularProgressIndicator();
                }
                return child;
              },
              filterQuality: FilterQuality.none,
              height: 200,
              fit: BoxFit.cover,
              alignment: Alignment.topLeft,
              width: 250,
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _isHover.dispose(); // Liberar ValueNotifier
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return Hero(
          tag: widget.projectRelease.project.name,
          child: Material(
            color: Colors.transparent,
            child: RepaintBoundary(
              child: MouseRegion(
                onHover: (event) {
                  if (_isHover.value) return;
                  _controller.forward();
                  _isHover.value = true;
                },
                onExit: (event) {
                  if (!_isHover.value) return;
                  _controller.reverse();
                  _isHover.value = false;
                },
                child: ValueListenableBuilder<bool>(
                  valueListenable: _isHover,
                  builder: (context, hoverValue, child) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 700),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: state.appTheme.isDarkMode()
                            ? Colors.black
                            : Colors.grey.shade900,
                        boxShadow: [
                          state.appTheme.isDarkMode()
                              ? BoxShadow(
                              color: Colors.white.withOpacity(0.5),
                              blurRadius: 15)
                              : BoxShadow(
                              color: Colors.blueAccent.withOpacity(0.7),
                              blurRadius: 15)
                        ],
                      ),
                      height: widget.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          animatedTop(),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  bannerTitle(),
                                  contentTitle(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

