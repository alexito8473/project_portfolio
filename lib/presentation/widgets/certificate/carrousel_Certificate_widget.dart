import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:proyect_porfolio/data/dataSource/certificate_data.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CarrouselCertificate extends StatelessWidget {
  const CarrouselCertificate({super.key});

  double viewPort({required BuildContext context}) {
    if (ResponsiveBreakpoints.of(context).isMobile) {
      return 0.9;
    }
    if (ResponsiveBreakpoints.of(context).screenWidth < 700) {
      return 0.7;
    }
    if (ResponsiveBreakpoints.of(context).screenWidth < 1000) {
      return 0.6;
    }
    return 0.4;
  }

  Widget buildCarrousel({required BuildContext context}) {
    return FlutterCarousel(
        items: List.generate(Certificate.values.length, (index) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child:
                  Image(image: AssetImage(Certificate.values[index].urlImg)));
        }),
        options: FlutterCarouselOptions(
            enlargeCenterPage: true,
            height: 500,
            enlargeFactor: 0.5,
            showIndicator: false,
            viewportFraction: viewPort(context: context),
            enableInfiniteScroll: true));
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveBreakpointsData responsiveBreakpoints =
        ResponsiveBreakpoints.of(context);
    return responsiveBreakpoints.isMobile ||
            responsiveBreakpoints.screenHeight < 600
        ? SliverToBoxAdapter(child: buildCarrousel(context: context))
        : SliverFillRemaining(child: buildCarrousel(context: context));
  }
}
