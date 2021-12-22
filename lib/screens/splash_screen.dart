import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = "/spalsh";
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () => Navigator.pushNamed(context, '/'));
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
        child: Image.asset(
          'lib/images/logo.png',
          width: 125,
          height: 125,
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          color: Colors.black,
          child: Text('Zero To Unicorn',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: Colors.white,
                  ))),
    ]));
  }
}
