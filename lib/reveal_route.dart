import 'package:flutter/material.dart';
import 'package:circular_reveal_transition/utils/circle_reveal_clipper.dart';

import 'utils/extensions.dart';

class CircularRevealRoute {
  static Route getRoute({GlobalKey globalKey, Widget destination}) {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 250),
      reverseTransitionDuration: Duration(milliseconds: 250),
      opaque: false,
      barrierDismissible: false,
      pageBuilder: (context, animation, secondaryAnimation) => destination,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var screenSize = MediaQuery.of(context).size;
        Offset center = globalKey.centeredOffset;
        double beginRadius = 0.0;
        double endRadius = screenSize.height * 1.2;

        var tween = Tween(begin: beginRadius, end: endRadius);
        var radiusTweenAnimation = animation.drive(tween).value;

        return ClipPath(
          clipper:
              CircleRevealClipper(radius: radiusTweenAnimation, center: center),
          child: child,
        );
      },
    );
  }
}
