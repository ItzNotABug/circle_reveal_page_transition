import 'package:circular_reveal_transition/reveal_route.dart';
import 'package:circular_reveal_transition/screens/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  goToSecondPage() => Navigator.push(
      context,
      CircularRevealRoute.getRoute(
          globalKey: _circularRevealKey, destination: SecondPage()));
}
