import 'package:animated_background/animated_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/dataSource/certificate_data.dart';

class CertificatePage extends StatefulWidget {
  final Certificate certificate;

  const CertificatePage({super.key, required this.certificate});

  @override
  State<CertificatePage> createState() => _CertificatePageState();
}

class _CertificatePageState extends State<CertificatePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.certificate.title),
        ),
        body: InteractiveViewer(
          panEnabled: true, // Permite arrastrar la imagen
          minScale: 1, // Zoom mínimo
          maxScale: 10, // Zoom máximo
          child: AnimatedBackground(
              behaviour: RandomParticleBehaviour(
                  paint: Paint(),
                  options: const ParticleOptions(
                      baseColor: Colors.orange,
                      opacityChangeRate: 0.30,
                      spawnMinSpeed: 20.0,
                      spawnMaxSpeed: 30.0,
                      spawnMinRadius: 7.0,
                      spawnMaxRadius: 30.0,
                      particleCount: 10)),
              vsync: this,
              child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Image.asset(widget.certificate.urlImg,
                    height: size.height * 0.8),
              )),
        ));
  }
}
