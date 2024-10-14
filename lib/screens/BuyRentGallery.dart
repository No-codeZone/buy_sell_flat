import 'package:buy_sell/res/CustomAppBarFirst.dart';
import 'package:buy_sell/res/CustomAppBarSecond.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BuyRentGallery extends StatefulWidget {
  const BuyRentGallery({super.key});

  @override
  State<BuyRentGallery> createState() => _BuyRentGalleryState();
}

class _BuyRentGalleryState extends State<BuyRentGallery> {
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      /*appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80.0), child: CustomAppBarSecond()),*/
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SizedBox(
          width: widthScreen,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10.0)),
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        width: widthScreen*0.9,
                        child: Image.asset(
                          'web/assets/images/india.png',
                          height: heightScreen * 0.3,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      child: Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          width: widthScreen*0.9,
                          child: Image.asset(
                            'assets/images/bedrm.jpg',
                            height: heightScreen * 0.3,
                            fit: BoxFit.fill,
                          )),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ClipRRect(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10.0)),
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        width: widthScreen * 0.9,
                        child: Image.asset('assets/images/hallimg.jpg',
                            height: heightScreen * 0.3, fit: BoxFit.fill),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ClipRRect(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10.0)),
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        width: widthScreen * 0.9,
                        child: Image.asset('assets/images/drawingrm.jpg',
                            height: heightScreen * 0.3, fit: BoxFit.fill),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ClipRRect(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10.0)),
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        width: widthScreen * 0.9,
                        child: Image.asset('assets/images/hallimga.jpg',
                            height: heightScreen * 0.3, fit: BoxFit.fill),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ClipRRect(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(10.0)),
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        width: widthScreen * 0.9,
                        child: Image.asset('assets/images/studyrm.jpg',
                            height: heightScreen * 0.3, fit: BoxFit.fill),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {},
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          child: SizedBox(
            width: 50,
            height: 50,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xff1b2b4f),
                  borderRadius: BorderRadius.all(Radius.circular(50.0))),
              child: const Icon(
                Icons.phone,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
        child: SizedBox(
          height: 45.0,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(40.0)),
            child: BottomAppBar(
              color: const Color(0xff232323),
              elevation: 10,
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
                          minWidth: widthScreen * 0.20,
                          onPressed: () {
                            setState(() {
                              // currentScreen =
                              // const RequestContact(); // if user taps on this dashboard tab will be active
                              // currentTab = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // Image.asset(
                              //   'assets/images/home_icon.png',
                              //   height: 20,
                              //   width: 20,
                              //   color: currentTab == 0 ? Colors.grey : Colors.white,
                              // ),
                              Container(
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(50.0))),
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
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    /*Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: widthScreen * 0.20,
                          onPressed: () {
                            setState(() {
                              // currentScreen =
                              // const RequestContact(); // if user taps on this dashboard tab will be active
                              // currentTab = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // Image.asset(
                              //   'assets/images/home_icon.png',
                              //   height: 20,
                              //   width: 20,
                              //   color: currentTab == 0 ? Colors.grey : Colors.white,
                              // ),
                              Container(
                                decoration: const BoxDecoration(
                                    color: Color(0xff1b2b4f),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50.0))),
                                child: const Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),*/
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: widthScreen * 0.20,
                          onPressed: () {
                            setState(() {});
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
                                    // color: currentTab == 0
                                    //     ? Colors.grey
                                    //     : Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'Chat Now',
                                    style: TextStyle(color: Colors.white),
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
          ),
        ),
      ),
    );
  }
}
