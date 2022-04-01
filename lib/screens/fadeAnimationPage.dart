import 'package:flutter/material.dart';

class FadeAnimationPage extends Page {
  final Widget child;

  const FadeAnimationPage({Key? key, required this.child});

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
        settings: this,
        pageBuilder: (_, anime1, anime2) {
          var curveTween = CurveTween(curve: Curves.easeIn);
          return FadeTransition(
            opacity: anime1.drive(curveTween),
            child: child,
          );
        });
  }
}
