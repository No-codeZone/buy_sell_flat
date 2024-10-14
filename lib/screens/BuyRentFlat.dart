import 'dart:math';
import 'package:buy_sell/res/CustomAppBarFirst.dart';
import 'package:buy_sell/screens/BuyRentFlatProfile.dart';
import 'package:buy_sell/screens/BuyRentGallery.dart';
import 'package:buy_sell/screens/LoginScreen.dart';
import 'package:buy_sell/screens/sub_screens/BuyRentOwnerNew.dart';
import 'package:buy_sell/screens/sub_screens/BuyRentProfileNew.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'BuyRentOwner.dart';

class BuyRentFlat extends StatefulWidget {
  const BuyRentFlat({super.key});

  @override
  State<BuyRentFlat> createState() => _BuyRentFlatState();
}

class _BuyRentFlatState extends State<BuyRentFlat> {
  List<String> images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
    "https://wallpaperaccess.com/full/2637581.jpg"
  ];

  List<String> placesRanchi = [
    "Lalpur",
    "Kantatoli",
    "Hinoo",
    "Main Road",
    "Kokar",
    "Booty More",
    "Tatisilwai",
    "Namkum",
    "Doranda",
    "Ring Road"
  ];

// list of images
  List imgList = [
    Image.asset('assets/images/1bhk.jpg'),
    Image.asset('assets/images/bedrm.jpg'),
    Image.asset('assets/images/drawingrm.jpg'),
    Image.asset('assets/images/hallimg.jpg'),
    Image.asset('assets/images/hallimga.jpg'),
    Image.asset('assets/images/studyrm.jpg'),
  ];

  void AddRandomImage() {
    var RandImgIndex = Random().nextInt(6);
    if (RandImgIndex == 0) {
      imgList.add(Image.asset('assets/images/1bhk.jpg'));
    } else if (RandImgIndex == 1) {
      imgList.add(Image.asset('assets/images/bedrm.jpg'));
    } else if (RandImgIndex == 2) {
      imgList.add(Image.asset('assets/images/drawingrm.jpg'));
    } else if (RandImgIndex == 3) {
      imgList.add(Image.asset('assets/images/hallimg.jpg'));
    } else if (RandImgIndex == 4) {
      imgList.add(Image.asset('assets/images/hallimga.jpg'));
    } else if (RandImgIndex == 5) {
      imgList.add(Image.asset('assets/images/studyrm.jpg'));
    }
  }

  late String username;
  // late String password;

  @override
  void initState() {
    super.initState();
    name();
  }

  void name() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username')!;
      // password = prefs.getString('password')!;
    });
  }

  void _logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
    prefs.setString('username', username);
    // prefs.setString('fullname', fullname);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => const LoginScreen()));
  }

  final List<Widget> _screenTab=[
    const BuyRentFlat(),
    const BuyRentFlatProfile(),
    const BuyRentGallery(),
    const BuyRentOwner()
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var ImgCount = imgList.length;

    return Scaffold(
      /*appBar:
      AppBar(
        leading:
        MaterialButton(
          onPressed: () {
            for(int i=0;i<_screenTab.length;i++){
              if(kDebugMode){
                print('screens $i');
                // print('Default tbCtrl value ${DefaultTabController.of(context).animateTo(i)}');
              }
              DefaultTabController.of(context).animateTo(i);
            }
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: SizedBox(
              child:
              Icon(Icons.menu,color: Colors.white,),
            ),
          ),
        ),
        backgroundColor: const Color(0xff1b2b4f),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const BuyRentOwner()));
            },
            color: const Color(0xff1b2b4f),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                Text(
                  'Add your listing',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          MaterialButton(onPressed: (){
            _logOut();
          },
            color: const Color(0xff1b2b4f),
            child: const Icon(Icons.power_settings_new,color: Colors.white,),
          )
        ],
      ),*/
      ///Layout builder
      body:
      SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth * 0.25,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          // elevation: MaterialStatePropertyAll(10.0),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const BuyRentProfileNew()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/buyhm.png',
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Text(
                            'Buy',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    width: screenWidth * 0.25,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          // elevation: MaterialStatePropertyAll(10.0),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const BuyRentOwnerNew()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/renthm.png',
                            width: 20.0,
                            height: 20.0,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Text(
                            'Rent',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.25,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child:
                    /*Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        child: Image.asset(
                          'assets/images/drawingrm.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 110.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(40.0))
                          ),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.grey),
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              suffixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              hintText: 'Search...',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50.0))),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),*/

                    ///FractionTransation
                    Column(
                  children: [
                    FractionalTranslation(
                      translation: const Offset(0, 0.1),
                      // translation: Offset.zero,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        child: Stack(children: [
                          /*Image.asset(
                            'assets/images/drawingrm.jpg',
                            fit: BoxFit.cover,
                            height: screenHeight * 0.18,
                            width: screenWidth,
                          ),*/
                          ImageSlideshow(
                            height: screenHeight * 0.18,
                            width: screenWidth,
                            // indicatorColor: Colors.blue,
                            onPageChanged: (value) {
                              debugPrint('Page changed: $value');
                            },
                            autoPlayInterval: 3000,
                            isLoop: true,
                            children: [
                              Image.asset(
                                'assets/images/drawingrm.jpg',
                                fit: BoxFit.cover,
                                height: screenHeight * 0.18,
                                width: screenWidth,
                              ),
                              Image.asset(
                                'assets/images/bedrm.jpg',
                                fit: BoxFit.cover,
                                height: screenHeight * 0.18,
                                width: screenWidth,
                              ),
                              Image.asset(
                                'assets/images/studyrm.jpg',
                                fit: BoxFit.cover,
                                height: screenHeight * 0.18,
                                width: screenWidth,
                              ),
                              Image.asset(
                                'assets/images/hallimga.jpg',
                                fit: BoxFit.cover,
                                height: screenHeight * 0.18,
                                width: screenWidth,
                              ),
                              Image.asset(
                                'assets/images/hallimg.jpg',
                                fit: BoxFit.cover,
                                height: screenHeight * 0.18,
                                width: screenWidth,
                              ),
                            ],
                          ),
                          const Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.only(top: 15.0),
                              child: Text(
                                'Duplex for sale only @ 80L',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50.0)),
                        child: Container(
                          decoration: const BoxDecoration(color: Colors.white),
                          child: SizedBox(
                            height: 45.0,
                            child: TextFormField(
                              style: const TextStyle(color: Colors.grey),
                              decoration: const InputDecoration(
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                hintText: 'Search...',
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50.0))),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Property At Your Budget',
                    style: TextStyle(fontSize: 13.0, color: Color(0xff6e6d6d)),
                  ),
                  Text(
                    'Buy the best one for your dream destination',
                    style: TextStyle(color: Color(0xffb0afaf), fontSize: 10.0),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: double.infinity,
              height: screenHeight * 0.2,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 150,
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            fit: StackFit.loose,
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10.0)),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  child: Image.asset(
                                    'assets/images/1bhk.jpg',
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0, top: 75.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    child: const Padding(
                                      padding: EdgeInsets.all(3.0),
                                      child: Text(
                                        '15k-18k',
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Text(
                            '3BHK Flat Residential',
                            style: TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Lalpur',
                            style: TextStyle(
                                fontSize: 10.0, color: Color(0xff6e6d6d)),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 150,
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            fit: StackFit.loose,
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10.0)),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  child: Image.asset(
                                    'assets/images/1bhk.jpg',
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0, top: 75.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    child: const Padding(
                                      padding: EdgeInsets.all(3.0),
                                      child: Text(
                                        '15k-18k',
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Text(
                            '3BHK Flat Residential',
                            style: TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Kantatoli',
                            style: TextStyle(
                                fontSize: 10.0, color: Color(0xff6e6d6d)),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 150,
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            fit: StackFit.loose,
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10.0)),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  child: Image.asset(
                                    'assets/images/1bhk.jpg',
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0, top: 75.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    child: const Padding(
                                      padding: EdgeInsets.all(3.0),
                                      child: Text(
                                        '15k-18k',
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Text(
                            '3BHK Flat Residential',
                            style: TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Namkum',
                            style: TextStyle(
                                fontSize: 10.0, color: Color(0xff6e6d6d)),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 150,
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            fit: StackFit.loose,
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10.0)),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  child: Image.asset(
                                    'assets/images/hallimga.jpg',
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0, top: 70.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    child: const Padding(
                                      padding: EdgeInsets.all(3.0),
                                      child: Text(
                                        '15k-18k',
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Text(
                            '3BHK Flat Residential',
                            style: TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Booty More',
                            style: TextStyle(
                                fontSize: 10.0, color: Color(0xff6e6d6d)),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 150,
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            fit: StackFit.loose,
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10.0)),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  child: Image.asset(
                                    'assets/images/1bhk.jpg',
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0, top: 70.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    child: const Padding(
                                      padding: EdgeInsets.all(3.0),
                                      child: Text(
                                        '15k-18k',
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Text(
                            '3BHK Flat Residential',
                            style: TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Lalpur',
                            style: TextStyle(
                                fontSize: 10.0, color: Color(0xff6e6d6d)),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 150,
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            fit: StackFit.loose,
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10.0)),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  child: Image.asset(
                                    'assets/images/1bhk.jpg',
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0, top: 70.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    child: const Padding(
                                      padding: EdgeInsets.all(3.0),
                                      child: Text(
                                        '15k-18k',
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Text(
                            '3BHK Flat Residential',
                            style: TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Lalpur',
                            style: TextStyle(
                                fontSize: 10.0, color: Color(0xff6e6d6d)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Upcoming Projects',
                    style: TextStyle(fontSize: 13.0, color: Color(0xff6e6d6d)),
                  ),
                  Text(
                    'Book Your Dream Home',
                    style: TextStyle(color: Color(0xffb0afaf), fontSize: 10.0),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: screenHeight * 0.3,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 450,
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            fit: StackFit.loose,
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10.0)),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  child: Image.asset(
                                    'assets/images/1bhk.jpg',
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0, top: 130.0),
                                  child: Container(
                                    width: 200,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    child: const Padding(
                                      padding: EdgeInsets.all(3.0),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Hariom Residency',
                                              style: TextStyle(fontSize: 10.0),
                                            ),
                                            Text(
                                              '3BHK Apartment, Lalpur',
                                              style: TextStyle(fontSize: 10.0),
                                            ),
                                            Text(
                                              '45-54 Lacs',
                                              style: TextStyle(fontSize: 10.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 450,
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            fit: StackFit.loose,
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10.0)),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  child: Image.asset(
                                    'assets/images/1bhk.jpg',
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0, top: 130.0),
                                  child: Container(
                                    width: 200,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    child: const Padding(
                                      padding: EdgeInsets.all(3.0),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Hariom Residency',
                                              style: TextStyle(fontSize: 10.0),
                                            ),
                                            Text(
                                              '3BHK Apartment, Lalpur',
                                              style: TextStyle(fontSize: 10.0),
                                            ),
                                            Text(
                                              '45-54 Lacs',
                                              style: TextStyle(fontSize: 10.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 450,
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            fit: StackFit.loose,
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10.0)),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  child: Image.asset(
                                    'assets/images/1bhk.jpg',
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0, top: 130.0),
                                  child: Container(
                                    width: 200,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    child: const Padding(
                                      padding: EdgeInsets.all(3.0),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Hariom Residency',
                                              style: TextStyle(fontSize: 10.0),
                                            ),
                                            Text(
                                              '3BHK Apartment, Lalpur',
                                              style: TextStyle(fontSize: 10.0),
                                            ),
                                            Text(
                                              '45-54 Lacs',
                                              style: TextStyle(fontSize: 10.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 450,
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            fit: StackFit.loose,
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10.0)),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  child: Image.asset(
                                    'assets/images/1bhk.jpg',
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8.0, top: 130.0),
                                  child: Container(
                                    width: 200,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    child: const Padding(
                                      padding: EdgeInsets.all(3.0),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Hariom Residency',
                                              style: TextStyle(fontSize: 10.0),
                                            ),
                                            Text(
                                              '3BHK Apartment, Lalpur',
                                              style: TextStyle(fontSize: 10.0),
                                            ),
                                            Text(
                                              '45-54 Lacs',
                                              style: TextStyle(fontSize: 10.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
