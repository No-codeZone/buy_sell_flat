import 'package:buy_sell/screens/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class OnBoardingUser extends StatefulWidget {
  const OnBoardingUser({super.key});

  @override
  State<OnBoardingUser> createState() => _OnBoardingUserState();
}

class _OnBoardingUserState extends State<OnBoardingUser> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return OnBoardingSlider(
      finishButtonText: 'Login',
      onFinish: () {
        if(kDebugMode){
          print('Login Button Clicked ! 1');
        }
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      },
      finishButtonStyle: const FinishButtonStyle(
        backgroundColor: Color(0xff1b2b4f),
      ),
      skipTextButton: const Text(
        'Skip',
        style: TextStyle(
          fontSize: 16,
          color: Color(0xff1b2b4f),
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: const Text(
        'Login',
        style: TextStyle(
          fontSize: 16,
          color: Color(0xff1b2b4f),
          fontWeight: FontWeight.w600,
        ),
      ),
      trailingFunction: () {
        if(kDebugMode){
          print('Login Button Clicked ! 2');
        }
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      },
      controllerColor: const Color(0xff1b2b4f),
      totalPage: 3,
      headerBackgroundColor: Colors.white,
      pageBackgroundColor: Colors.white,
      background: [
        Image.asset(
          'assets/images/onbrdimga.png',
          height: 400,
        ),
        Image.asset(
          'assets/images/onbrdimgb.png',
          height: 400,
        ),
        Image.asset(
          'assets/images/onbrdimgc.png',
          height: 400,
          width: screenWidth,
        ),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'Confused..!?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff1b2b4f),
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Trying to find the perfect dream home',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'You’ve reached your destination.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff1b2b4f),
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Society Prime will assistant you for your dream home...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'Join now!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff1b2b4f),
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Where impossible becomes possible...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
    /*Scaffold(
      backgroundColor: const Color(0xfff3f3f3),
      body:
      CupertinoApp(
        debugShowCheckedModeBanner: false,
        home: OnBoardingSlider(
          headerBackgroundColor: Colors.white,
          finishButtonText: 'Login',
          onFinish: () {
            if (kDebugMode) {
              print('Login button 2 pressed');
            }
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
          finishButtonStyle: const FinishButtonStyle(
            backgroundColor: Color(0xff1b2b4f),
          ),
          trailing: MaterialButton(
              onPressed: () {
                if (kDebugMode) {
                  print('Login button pressed');
                }
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginScreen()));
              },
              child: const Text('Skip')),
          background: [
            Image.asset(
              'assets/images/onbrdimga.png',
              height: 400.0,
              width: screenWidth,
            ),
            Image.asset(
              'assets/images/onbrdimga.png',
              height: 400.0,
              width: screenWidth,
            ),
          ],
          totalPage: 2,
          speed: 1.8,
          pageBodies: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Column(
                children: <Widget>[
                  SizedBox(
                    height: 540,
                  ),
                  Text('Confused ?'),
                  Text(
                    'Looking for your dream plot',
                    style: TextStyle(color: Colors.grey, fontSize: 12.0),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Column(
                children: <Widget>[
                  SizedBox(
                    height: 540,
                  ),
                  Text(
                    'This is the right to book',
                    style: TextStyle(color: Colors.grey, fontSize: 12.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );*/
  }
}
