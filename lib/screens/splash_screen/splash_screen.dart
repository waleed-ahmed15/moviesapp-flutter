import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moviesapp/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 4))
        ..repeat();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () => Get.to(() => const HomeScreen()));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: AnimatedBuilder(
                animation: _animationController,
                child: const SizedBox(
                    width: 200,
                    height: 200,
                    child: Image(
                      image: AssetImage("assets/images/movie-clapper-open.png"),
                    )),
                builder: (BuildContext context, Widget? child) {
                  // print(_animationController.value);
                  return Transform.rotate(
                    angle: _animationController.value * 3,
                    child: child,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
