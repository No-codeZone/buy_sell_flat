import 'dart:async';
import 'package:buy_sell/screens/LoginScreen.dart';
import 'package:buy_sell/screens/OnboadingUser.dart';
import 'package:flutter/material.dart';

import 'BuyRentFlat.dart';
import 'MakeCall.dart';

class SplashScreen extends StatefulWidget {
  final bool user;
  const SplashScreen(this.user, {super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplashScrn();
  }

  startSplashScrn(){
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (c) => widget.user ? SellBuyMain() : const OnBoardingUser()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f3f3),
      body: Center(
        child: SizedBox(
          width: 150.0,
          height: 150.0,
          child: Image.asset(
            'assets/images/realeslg.png',
          ),
        ),
      ),
    );
  }
}
