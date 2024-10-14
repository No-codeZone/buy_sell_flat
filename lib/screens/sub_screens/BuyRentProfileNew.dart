import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../res/CustomAppBarSecond.dart';

class BuyRentProfileNew extends StatefulWidget {
  const BuyRentProfileNew({super.key});

  @override
  State<BuyRentProfileNew> createState() => _BuyRentProfileNewState();
}

class _BuyRentProfileNewState extends State<BuyRentProfileNew> {
  int currentTab = 0;

  List<IconData> iconList = [
    Icons.phone,
  ];
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery
        .of(context)
        .size
        .width;
    final heightScreen = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100.0), child: CustomAppBarSecond()),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: SizedBox(
                width: widthScreen * 0.9,
                child: Image.asset(
                  'assets/images/hallimg.jpg',
                  height: heightScreen * 0.4,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '\u{20B9}',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text('15000'),
                          Text(
                            '/month',
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          )
                        ],
                      ),
                      const Text(
                        '\u{20B9} 20,000 security deposit',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 15.0,
                            height: 15.0,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(50.0)),
                                color: Color(0xff1b2b4f)
                            ),
                            child: const Icon(Icons.phone, color: Colors.white,size: 10.0,),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          InkWell(
                            child: const Text('9470370360',
                              style: TextStyle(color: Color(0xff1b2b4f)),),
                            onTap: () {
                              if (kDebugMode) {
                                print('Make call on this number !');
                              }
                              launch("tel://6464614614");
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Color(0xffd3d3d3),
                            borderRadius: BorderRadius.all(Radius.circular(2.0))
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 5.0, right: 5.0, top: 2.0, bottom: 2.0),
                          child: Text(
                            'SemiFurnished',
                            style: TextStyle(
                                color: Color(0xff656565), fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 22.0),
                  child: Text(
                    'Property Details',
                    style: TextStyle(color: Color(0xff656565)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: widthScreen * 0.5,
                            child: const Text(
                              'Layout',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 10),
                            ),
                          ),
                          // SizedBox(width: 200.0),
                          SizedBox(
                            width: widthScreen * 0.38,
                            child: const Text(
                              '3 BHK, 3 Baths, Pooja Room',
                              style: TextStyle(fontSize: 10),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: widthScreen * 0.5,
                            child: const Text(
                              'Carpet Area',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 10),
                            ),
                          ),
                          // SizedBox(width: 175.0),
                          SizedBox(
                            width: widthScreen * 0.38,
                            child: const
                            Text(
                              '1600 sq. ft.',
                              style: TextStyle(fontSize: 10),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        width: widthScreen,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: widthScreen * 0.5,
                              child: const Text(
                                'Floor Number',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 10),
                              ),
                            ),
                            // SizedBox(width: 165.0),
                            SizedBox(
                              width: widthScreen * 0.38,
                              child: const Text(
                                '3',
                                style: TextStyle(fontSize: 10),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: widthScreen * 0.5,
                            child: const
                            Text(
                              'Flooring',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 10),
                            ),
                          ),
                          // SizedBox(width: 190.0),
                          SizedBox(
                            width: widthScreen * 0.38,
                            child: const Text(
                              'Granite',
                              style: TextStyle(fontSize: 10),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: widthScreen * 0.5,
                            child: const Text(
                              'Facing',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 10),
                            ),
                          ),
                          // SizedBox(width: 195.0),
                          SizedBox(
                            width: widthScreen * 0.38,
                            child: const Text(
                              'East',
                              style: TextStyle(fontSize: 10),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: widthScreen * 0.5,
                            child: const Text(
                              'Rental Agreement Duration',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 10),
                            ),
                          ),
                          // SizedBox(width: 100.0),
                          SizedBox(
                            width: widthScreen * 0.38,
                            child: const Text(
                              '11 Months',
                              style: TextStyle(fontSize: 10),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: widthScreen * 0.5,
                            child: const Text(
                              'Notice Period',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 10),
                            ),
                          ),
                          // SizedBox(width: 165.0),
                          SizedBox(
                            width: widthScreen * 0.38,
                            child: const Text(
                              '2 Months',
                              style: TextStyle(fontSize: 10),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: widthScreen * 0.5,
                            child: const Text(
                              'Property ID',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 10),
                            ),
                          ),
                          // SizedBox(width: 175.0),
                          SizedBox(
                            width: widthScreen * 0.38,
                            child: const Text(
                              'SP79797709',
                              style: TextStyle(fontSize: 10),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
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
              // shape: const CircularNotchedRectangle(),
              // elevation: 10,
              // notchMargin: 1,
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
