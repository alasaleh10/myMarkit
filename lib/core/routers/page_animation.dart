import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

pageAnimation({required Widget page}) {
  return CustomTransitionPage(
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: Tween(begin: 0.0, end: 1.0).animate(animation),
        child: child,
      );
    },
  );
}
