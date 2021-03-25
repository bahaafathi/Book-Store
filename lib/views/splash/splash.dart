import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ebook_app/util/router.dart';
import 'package:flutter_ebook_app/views/main_screen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  startTimeout() {
    return new Timer(Duration(seconds: 2), handleTimeout);
  }

  void handleTimeout() {
    changeScreen();
  }

  changeScreen() async {
    MyRouter.pushPageReplacement(
      context,
      MainScreen(),
    );
  }

  @override
  void initState() {
    super.initState();
    startTimeout();

    ///تايمر بيبتدي يعد ثانيتين
    ///قبل لما البولد تتبندي اصلا
    ///بعد كدة البولد ميثود تشتغل ب
    ///وبعد كدة الثانيتين يخلصو
    ///ويقوم داخل علي الصفحه الرئيسيه
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/app-icon.png",
              height: 300.0,
              width: 300.0,
            ),
          ],
        ),
      ),
    );
  }
}
