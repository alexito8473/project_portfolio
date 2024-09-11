import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:proyect_porfolio/structure/blocs/appTheme/app_theme_bloc.dart';
import '../utils/CheckSize.dart';
import '../widgets/customButton_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    bool isMobile = CheckSize.isMobile(size);
    bool overSideWidth = CheckSize.isOverSideWidth(size);
    return Padding(
      padding: EdgeInsets.only(
          top: !isMobile ? size.height * .07 : size.height * .04,
          bottom: size.height * .02,
          left: size.width * .1,
          right: size.width * .1),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        spacing: 20,
        runSpacing: 20,
        children: [
          Hero(
              tag: "Image",
              child: ClipOval(
                child: Image.asset(
                  "assets/images/personal.webp",
                  width: overSideWidth ? 300 : 220,
                ),
              )),
          Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                border: DashedBorder.all(
                  color: context.watch<AppThemeBloc>().state.isDarkMode()
                      ? Colors.white
                      : Colors.black,
                  dashLength: 40,
                  width: 2,
                  isOnlyCorner: true,
                  strokeAlign: BorderSide.strokeAlignInside,
                  strokeCap: StrokeCap.round,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 55,
                      child: AutoSizeText(
                        "Alejandro Aguilar",
                        maxLines: 1,
                        style: TextStyle(fontSize: isMobile ? 25 : 35),
                      ),
                    ),
                    Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          IconButtonNavigator(
                            uri: Uri.parse('https://github.com/alexito8473'),
                            color:
                                context.watch<AppThemeBloc>().state.isDarkMode()
                                    ? Colors.white
                                    : Colors.black,
                            tooltip: 'Github',
                            iconUri: 'assets/svg/github.svg',
                            secondColor: true,
                            overSideWidth: overSideWidth,
                          ),
                          IconButtonNavigator(
                            uri: Uri.parse(
                                'https://www.linkedin.com/in/alejandro-aguilar-83b0b6220/'),
                            color: Colors.blue,
                            tooltip: 'Linkedin',
                            iconUri: 'assets/svg/linkedin.svg',
                            secondColor: false,
                            overSideWidth: overSideWidth,
                          ),
                          ButtonDownloadPdf(
                            overSideWidth: overSideWidth,
                          )
                        ]),
                  ])),
        ],
      ),
    );
  }
}
