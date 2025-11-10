import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyect_porfolio/data/dataSource/certificate_data.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'carrousel_cerrtificate_widget.dart';

class TypeCarrouselCertificate extends StatelessWidget {
  const TypeCarrouselCertificate({super.key});

  double viewPort({required BuildContext context}) {
    if (ResponsiveBreakpoints
        .of(context)
        .isMobile) {
      return 0.9;
    }
    if (ResponsiveBreakpoints
        .of(context)
        .screenWidth < 700) {
      return 0.7;
    }
    if (ResponsiveBreakpoints
        .of(context)
        .screenWidth < 1000) {
      return 0.6;
    }
    return 0.4;
  }

  void navigateToCertificatePage(BuildContext context,
      Certificate certificate) {
    context.go('/certificate/${certificate.name}');
  }

  @override
  Widget build(BuildContext context) {
    final double port = viewPort(context: context);
    ResponsiveBreakpointsData responsiveBreakpoints =
    ResponsiveBreakpoints.of(context);
    return responsiveBreakpoints.isMobile ||
        responsiveBreakpoints.screenHeight < 600
        ? SliverToBoxAdapter(child: CarrouselCertificateWidget(
        onPressedCertificate: ({required certificate}) {
          navigateToCertificatePage(context, certificate);
        },
        viewPort: port))
        : SliverFillRemaining(child: CarrouselCertificateWidget(
        onPressedCertificate: ({required certificate}) {
          navigateToCertificatePage(context, certificate);
        },
        viewPort: port));
  }
}
