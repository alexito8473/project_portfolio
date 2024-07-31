import 'dart:math';
import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../structure/blocs/appTheme/app_theme_bloc.dart';

class CustomParticle extends ParticleBehaviour {
  static Random random = Random();

  CustomParticle({
    super.options,
    super.paint,
  });

  CustomParticle setOptions(BuildContext context) {
    bool control =
        context.watch<AppThemeBloc>().state.appTheme == AppTheme.LIGHT;
    options = ParticleOptions(
      baseColor: Colors.blue,
      opacityChangeRate: 0.25,
      minOpacity: control ? 0.05 : 0.1,
      maxOpacity: control ? 0.1 : 0.4,
      spawnMinSpeed: 30.0,
      spawnMaxSpeed: 80.0,
      spawnMinRadius: 7.0,
      spawnMaxRadius: 15.0,
      particleCount: 50,
    );
    return this;
  }

  @override
  void initFrom(Behaviour oldBehaviour) {
    super.initFrom(oldBehaviour);
    if (oldBehaviour is RandomParticleBehaviour || particles == null) return;
    for (Particle particle in particles!) {
      initParticle(particle);
    }
  }

  @override
  void initParticle(Particle p) {
    initPosition(p);
    initRadius(p);

    final double deltaSpeed = (options.spawnMaxSpeed - options.spawnMinSpeed);
    double speed = random.nextDouble() * deltaSpeed + options.spawnMinSpeed;
    initDirection(p, speed);

    final double deltaOpacity = (options.maxOpacity - options.minOpacity);
    p.alpha = options.spawnOpacity;
    p.targetAlpha = random.nextDouble() * deltaOpacity + options.minOpacity;
  }

  /// Initializes a new position for the provided [Particle].
  @protected
  void initPosition(Particle p) {
    p.cx = random.nextDouble() * size!.width;
    p.cy = random.nextDouble() * size!.height;
  }

  /// Initializes a new radius for the provided [Particle].
  @protected
  void initRadius(Particle p) {
    final deltaRadius = (options.spawnMaxRadius - options.spawnMinRadius);
    p.radius = random.nextDouble() * deltaRadius + options.spawnMinRadius;
  }

  /// Initializes a new direction for the provided [Particle].
  @protected
  void initDirection(Particle p, double speed) {
    double dirX = random.nextDouble() - 0.5;
    double dirY = random.nextDouble() - 0.5;
    double magSq = dirX * dirX + dirY * dirY;
    double mag = magSq <= 0 ? 1 : sqrt(magSq);

    p.dx = dirX / mag * speed;
    p.dy = dirY / mag * speed;
  }

  @override
  void onOptionsUpdate(ParticleOptions? oldOptions) {
    super.onOptionsUpdate(oldOptions);
    double minSpeedSqr = options.spawnMinSpeed * options.spawnMinSpeed;
    double maxSpeedSqr = options.spawnMaxSpeed * options.spawnMaxSpeed;
    if (particles == null) return;
    for (Particle p in particles!) {
      // speed assignment is better done this way, to prevent calculation of square roots if not needed
      double speedSqr = p.speedSqr;
      if (speedSqr > maxSpeedSqr) {
        p.speed = options.spawnMaxSpeed;
      } else if (speedSqr < minSpeedSqr) p.speed = options.spawnMinSpeed;

      // TODO: handle opacity change

      if (p.radius < options.spawnMinRadius ||
          p.radius > options.spawnMaxRadius) initRadius(p);
    }
  }
}
