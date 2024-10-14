import 'package:buy_sell/screens/BuyRentFlatProfile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screens/MakeCall.dart';
import '../screens/RequestContact.dart';
import '../screens/WhatsappMsg.dart';

class CustomAnimatedNavBar extends StatefulWidget {
  const CustomAnimatedNavBar({super.key});

  @override
  State<CustomAnimatedNavBar> createState() => _CustomAnimatedNavBarState();
}

class _CustomAnimatedNavBarState extends State<CustomAnimatedNavBar> {
  int currentTab = 0;
  final List<Widget> screens = [
    const RequestContact(),
    // const MakeCall(),
    const WhatsappMsg()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const BuyRentFlatProfile();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: Container(
        height: 80,
        width: 80,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xffc5c4c4), Colors.white]),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: FloatingActionButton(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))),
            backgroundColor: const Color(0xfff5f5f5),
            onPressed: () {
              setState(() {
                currentScreen = const RequestContact();
                currentTab = 1;
              });
            },
            child: MaterialButton(
              minWidth: screenWidth * 0.45,
              onPressed: () {
                _requestContact();
                setState(() {
                  currentScreen = const RequestContact();
                  currentTab = 1;
                });
              },
              child: Container(
                height: 30,
                width: 40,
                decoration: BoxDecoration(
                  color: const Color(0xffe7e7e7),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.contact_phone_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Request Contact',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xff3a275e),
        shape: const CircularNotchedRectangle(),
        elevation: 10,
        notchMargin: 45,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MaterialButton(
                    minWidth: screenWidth * 0.20,
                    onPressed: () {
                      _makeCall();
                      setState(() {
                        currentScreen =
                            const BuyRentFlatProfile(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                      // launchUrl("tel://21213123123" as Uri);
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        // color: currentTab == 0 ? Colors.grey : Colors.white,
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MaterialButton(
                    minWidth: screenWidth * 0.20,
                    onPressed: () {
                      _textWhatsapp();
                      setState(() {
                        currentScreen =
                            const WhatsappMsg(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/whatsapp.png',
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Chat Now',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _makeCall() {
    if (kDebugMode) {
      print('Make call button pressed !');
    }
    launch("tel://21213123123");
  }

  _textWhatsapp() {
    if (kDebugMode) {
      print('Text over whatsapp button pressed !');
    }
  }

  _requestContact() {
    if (kDebugMode) {
      print('Request contact button pressed !');
    }
  }
}
