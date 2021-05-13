import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transition_animations/screens/second_page.dart';
import 'package:transition_animations/utils/circle_reveal_clipper.dart';

import '../utils/extensions.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final _circularRevealKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrange,
        appBar: AppBar(
          title: Text("First Page"),
        ),
        body: Center(
          child: FloatingActionButton(
              key: _circularRevealKey,
              child: Icon(Icons.auto_awesome),
              onPressed: () {
                HapticFeedback.heavyImpact();
                goToSecondPage();
              }),
        ));
  }

  goToSecondPage() => Navigator.push(context, _createRoute());

  Route _createRoute() {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 250),
      reverseTransitionDuration: Duration(milliseconds: 250),
      opaque: false,
      barrierDismissible: false,
      pageBuilder: (context, animation, secondaryAnimation) => SecondPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var screenSize = MediaQuery.of(context).size;
        Offset center = _circularRevealKey.centeredOffset;
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
