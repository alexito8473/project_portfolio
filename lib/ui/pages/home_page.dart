import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/appLocale/app_locale_bloc.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';
import '../../models/Item.dart';

import '../screens/home_screens.dart';
import '../utils/CheckSize.dart';
import '../widgets/customButton_widget.dart';
import '../widgets/header_widegt.dart';
import '../widgets/listTechnology.dart';
import '../widgets/project_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late final Widget _listTechnology;
  late final Widget _listProject;
  late final Widget _header;
  late final List<GlobalKey> _listGlobalKey;
  final GlobalKey _headerKey = GlobalKey();
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool isActiveBannerTop = false;
  @override
  void initState() {
    loadWidget();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        reverseDuration: const Duration(milliseconds: 500));
    _animation = CurvedAnimation(
      parent: _animationController,
      reverseCurve: Curves.linear,
      curve: Curves.linear,
    );
    super.initState();
  }

  void scrollToItem(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    _animationController.dispose(); // Siempre recuerda limpiar el controlador
    super.dispose();
  }

  void _checkIfWidgetIsVisible() {
    Size size = MediaQuery.sizeOf(context);
    bool isStopInformationTop = CheckSize.isStopInformationTop(size);
    if (!isStopInformationTop) return;
    bool isMobile = CheckSize.isMobile(size);
    if (isMobile) return;
    RenderBox? box =
        _headerKey.currentContext?.findRenderObject() as RenderBox?;
    if (box != null) {
      Offset position = box.localToGlobal(Offset.zero);

      // Obtén las dimensiones visibles del área de scroll
      double screenHeight = size.height;

      // Verifica si el widget está dentro del rango visible
      // true cuando esta renderizado y false cuando no

      if (position.dy < screenHeight && position.dy + box.size.height > 0) {
        if (isActiveBannerTop) {
          setState(() {
            _animationController.reverse();
            isActiveBannerTop = false;
          });
        }
      } else {
        if (!isActiveBannerTop) {
          setState(() {
            _animationController.forward();
            isActiveBannerTop = true;
          });
        }
      }
    }
  }

  Widget topNavigation() {
    Size size = MediaQuery.sizeOf(context);
    bool isMobile = CheckSize.isMobile(size);
    bool isStopInformationTop = CheckSize.isStopInformationTop(size);
    return Container(
        padding:
            EdgeInsets.only(left: size.width * 0.05, right: size.width * 0.04),
        height: isMobile ? 60 : 80,
        alignment: Alignment.center,
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isMobile
                ? const Expanded(
                    child: AutoSizeText(
                    "Full Stack Developer",
                    style: TextStyle(fontSize: 28),
                    maxLines: 1,
                  ))
                : const AutoSizeText(
                    "Full Stack Developer",
                    style: TextStyle(fontSize: 28),
                    maxLines: 1,
                  ),
            if (isActiveBannerTop && isStopInformationTop ||
                _animationController.isAnimating)
              FadeTransition(
                  opacity: _animation,
                  child: Expanded(
                      child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    spacing: 20,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/personal.webp",
                          filterQuality: FilterQuality.high,
                          width: 50,
                        ),
                      ),
                      const AutoSizeText(
                        "Alejandro Aguilar",
                        maxLines: 1,
                        style: TextStyle(fontSize: 25),
                      ),
                      IconButtonNavigator(
                        uri: Uri.parse('https://github.com/alexito8473'),
                        color: context.watch<AppThemeBloc>().state.isDarkMode()
                            ? Colors.white
                            : Colors.black,
                        tooltip: 'Github',
                        iconUri: 'assets/svg/github.svg',
                        secondColor: true,
                        overSideWidth: false,
                      ),
                      IconButtonNavigator(
                        uri: Uri.parse(
                            'https://www.linkedin.com/in/alejandro-aguilar-83b0b6220/'),
                        color: Colors.blue,
                        tooltip: 'Linkedin',
                        iconUri: 'assets/svg/linkedin.svg',
                        secondColor: false,
                        overSideWidth: false,
                      ),
                      const ButtonDownloadPdf(
                        overSideWidth: false,
                      )
                    ],
                  ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    onPressed: () =>
                        context.read<AppLocaleBloc>().add(ChangeLocalEvent()),
                    icon: Text(
                        context
                            .watch<AppLocaleBloc>()
                            .state
                            .locale
                            .getLenguajeCode(),
                        style: const TextStyle(fontSize: 25))),
                Padding(
                    padding: EdgeInsets.only(left: size.width * 0.01),
                    child: IconButton(
                        onPressed: () => context
                            .read<AppThemeBloc>()
                            .add(ChangeThemeEvent()),
                        icon: context
                            .watch<AppThemeBloc>()
                            .state
                            .appTheme
                            .getIcon())),
                Padding(
                    padding: EdgeInsets.only(left: size.width * 0.01),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        customButton: const Icon(Icons.list, size: 38),
                        items: List.generate(
                          MenuItems.values.length,
                          (index) {
                            return DropdownMenuItem<int>(
                                value: index,
                                child:
                                    MenuItems.values[index].buildItem(context));
                          },
                        ),
                        onChanged: (value) {
                          if (value != null) {
                            scrollToItem(_listGlobalKey[value]);
                          }
                        },
                        barrierColor: Colors.black.withOpacity(0.4),
                        dropdownStyleData: DropdownStyleData(
                          width: 170,
                          useSafeArea: true,
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color:
                                context.watch<AppThemeBloc>().state.isDarkMode()
                                    ? Colors.grey.shade800
                                    : Colors.blueAccent,
                          ),
                        ),
                      ),
                    ))
              ],
            )
          ],
        ));
  }

  Future<bool> loadWidget() async {
    _listTechnology = const ListTechnology();
    _listProject = const ListProject();
    _header = HeaderWidget(
      key: _headerKey,
    );
    _listGlobalKey = [
      GlobalKey(),
      GlobalKey(),
      GlobalKey(),
      GlobalKey(),
      GlobalKey()
    ];
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
        scrollController: _scrollController,
        listGlobalKey: _listGlobalKey,
        topNavigation: topNavigation(),
        listTechnology: _listTechnology,
        listProject: _listProject,
        header: _header,
        checkIfWidgetIsVisible: _checkIfWidgetIsVisible);
  }
}
