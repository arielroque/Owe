import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:owe/owe/presentation/pages/onboarding/onboarding_page.dart';
import 'package:owe/owe/utils/color_theme.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  Timer _timer;

  SplashPageState() {
    _timer = new Timer(const Duration(milliseconds: 3000), isLogged);
  }

  isLogged() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoardingPage()));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorThemeApp.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                height: 155.0,
                child: Hero(
                  tag: 'logo',
                  child: Image.asset("assets/images/splash.png",
                      fit: BoxFit.contain),
                )),
            SizedBox(
              height: 30.0,
            ),
            SpinKitRipple(
              color: ColorThemeApp.secondColor,
              size: 75.0,
            ),
          ],
        ),
      ),
    );
  }
}