import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyect_porfolio/data/dataSource/certificate_data.dart';
import 'package:proyect_porfolio/presentation/utils/calculate_size.dart';

import 'carrousel_cerrtificate_widget.dart';

class TypeCarrouselCertificate extends StatelessWidget {
  const TypeCarrouselCertificate({super.key});



  double _viewPort({required Size size}) {
    if (CalculateSize.isMobile(size)) {
      return 0.9;
    }
    if (size.width < 700) {
      return 0.7;
    }
    if (size.width < 1000) {
      return 0.6;
    }
    return 0.4;
  }

  void _navigateToCertificatePage(BuildContext context,
      Certificate certificate) {
    context.go('/certificate/${certificate.name}');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    final double port = _viewPort(size: size);
    return CalculateSize.isMobile(size) || size.height < 600
        ? SliverToBoxAdapter(child: CarrouselCertificateWidget(
        onPressedCertificate: ({required certificate}) {
          _navigateToCertificatePage(context, certificate);
        },
        viewPort: port))
        : SliverFillRemaining(child: CarrouselCertificateWidget(
        onPressedCertificate: ({required certificate}) {
          _navigateToCertificatePage(context, certificate);
        },
        viewPort: port));
  }
}
