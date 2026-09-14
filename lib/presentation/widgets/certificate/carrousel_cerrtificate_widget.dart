import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import '../../../data/dataSource/certificate_data.dart';
import '../../../domain/cubits/appTheme/app_theme_cubit.dart';

class CarrouselCertificateWidget extends StatelessWidget {
  final Function({required Certificate certificate}) onPressedCertificate;
  final double viewPort;
  const CarrouselCertificateWidget({super.key, required this.onPressedCertificate, required this.viewPort});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppThemeCubit, AppThemeState, bool>(
      selector: (state) => state.appTheme.isDarkMode(),
      builder: (context, state) {
        return FlutterCarousel(
                items: List.generate(Certificate.values.length, (index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                          child: Container(
                        decoration:
                            BoxDecoration(boxShadow: [BoxShadow(color: state ? Colors.white38 : Colors.black26, spreadRadius: 0.1, blurRadius: 20)]),
                        child: InkWell(
                            onTap: () => onPressedCertificate(certificate: Certificate.values[index]),
                            child: RepaintBoundary(
                                child: Image(
                                filterQuality: FilterQuality.none,
                                image: ResizeImage(AssetImage(Certificate.values[index].urlImg), width: 400)))),
                      )));
                }),
                options: FlutterCarouselOptions(
                    enlargeCenterPage: true,
                    height: 500,
                    enlargeFactor: 0.5,
                    showIndicator: false,
                    viewportFraction: viewPort,
                    enableInfiniteScroll: true));
      },
    );
  }
}
