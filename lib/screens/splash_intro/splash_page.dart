import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:medicare/constants/app_colors.dart';
import 'package:medicare/core/nav_manager.dart';
import 'package:medicare/screens/splash_intro/on_boarding_handler.dart';
import '../../main.dart';
import '../home/view_handler.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _isFaded = false;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 400), () {
      setState(() {
        _isFaded = true;
      });
    });

    Future.delayed(Duration(milliseconds: 1700), () {
      final isShown = prefs.getBool("onBoardingShown") ?? false;
      NavManager.gotoAndRemoveAllPrevious(
          isShown ? ViewHandler() : OnBoardingHandler());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarColor: bgColor, systemNavigationBarColor: bgColor),
      child: Scaffold(
        backgroundColor: bgColor,
        body: Center(
            child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Hero(
                  tag: 'splash',
                  child: Image.asset(
                    'assets/images/appIcon.png',
                    height: 200,
                    width: 200,
                    color: primaryColor,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: "Med",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: "Care",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AnimatedPositioned(
              duration: 1.3.seconds,
              curve: Curves.easeInOutQuart,
              top: _isFaded ? 280 : 0,
              child: Container(
                height: 280,
                width: 280,
                color: bgColor,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
