import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proyect_porfolio/presentation/pages/home_page.dart';
import 'package:proyect_porfolio/presentation/pages/project_page.dart';

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
            path: 'projects',
            pageBuilder: (context, state) => CustomTransitionPage(
                key: state.pageKey,
                reverseTransitionDuration: const Duration(milliseconds: 800),
                maintainState: true,
                transitionDuration: const Duration(milliseconds: 800),
                child: const ProjectPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                }))
      ])
]);
