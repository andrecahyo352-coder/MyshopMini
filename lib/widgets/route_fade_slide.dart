import 'package:flutter/material.dart';

class FadeSlideRoute extends PageRouteBuilder {
  final Widget page;
  FadeSlideRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final slide = Tween<Offset>(
              begin: const Offset(0, 0.2),
              end: Offset.zero,
            ).animate(animation);
            final fade = Tween<double>(
              begin: 0,
              end: 1,
            ).animate(animation);
            return SlideTransition(
              position: slide,
              child: FadeTransition(opacity: fade, child: child),
            );
          },
        );
}
