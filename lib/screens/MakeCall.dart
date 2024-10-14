// import 'dart:js';
import 'package:buy_sell/screens/BuyRentFlatProfile.dart';
import 'package:buy_sell/screens/BuyRentGallery.dart';
import 'package:buy_sell/screens/BuyRentOwner.dart';
import 'package:buy_sell/screens/WhatsappMsg.dart';
import 'package:buy_sell/screens/sub_screens/BuyRentOwnerNew.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sidebarx/sidebarx.dart';
import 'BuyRentFlat.dart';
import 'LoginScreen.dart';

class SellBuyMain extends StatefulWidget {
  const SellBuyMain({super.key});

  @override
  State<SellBuyMain> createState() => _SellBuyMainState();
}

class _SellBuyMainState extends State<SellBuyMain> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  late String username;

  @override
  void initState() {
    super.initState();
    name();
  }

  void name() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username')!;
    });
  }

  void _logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
    prefs.setString('username', username);
    if (kDebugMode) {
      print('UserName is ewgdjwbdj${prefs.setString('username', username)}');
    }
    Navigator.pushReplacement(context as BuildContext,
        MaterialPageRoute(builder: (c) => const LoginScreen()));
    if (kDebugMode) {
      print('UserName is wcs${prefs.setString('username', username)}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            key: _key,
            appBar: isSmallScreen
                ? AppBar(
                    backgroundColor: const Color(0xff1b2b4f),
                    // title: Text(_getTitleByIndex(_controller.selectedIndex)),
                    leading: IconButton(
                      onPressed: () {
                        // if (!Platform.isAndroid && !Platform.isIOS) {
                        //   _controller.setExtended(true);
                        // }
                        _key.currentState?.openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                    actions: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const BuyRentOwnerNew()));
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
                      MaterialButton(
                        onPressed: () {
                          if (kDebugMode) {
                            print('Sidexbar logout button pressed here !');
                          }
                          try{
                            _logOut();
                          }catch(exception){
                            if (kDebugMode) {
                              print('Unable to logout with error ${exception.toString()}');
                            }
                          }
                        },
                        color: const Color(0xff1b2b4f),
                        child: const Icon(
                          Icons.power_settings_new,
                          color: Colors.white,
                        ),
                      )
                      // InkWell(
                      //   onTap: () => _logOut(),
                      //   overlayColor:
                      //       const MaterialStatePropertyAll(Color(0xff1b2b4f)),
                      //   child: const Icon(
                      //     Icons.power_settings_new,
                      //     color: Colors.white,
                      //   ),
                      // )
                    ],
                  )
                : null,
            drawer: ExampleSidebarX(controller: _controller),
            body: Row(
              children: [
                if (!isSmallScreen) ExampleSidebarX(controller: _controller),
                Expanded(
                  child: Center(
                    child: _ScreensExample(
                      controller: _controller,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    super.key,
    required SidebarXController controller,
  }) : _controller = controller;

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xff1b2b4f),
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xff1b2b4f)),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [Color(0xff1b2b4f), Colors.white],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: Color(0xff1b2b4f),
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/images/avatar.png'),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Dashboard',
          onTap: () {
            debugPrint('Dashboard');
          },
        ),
        const SidebarXItem(
          icon: Icons.list,
          label: 'Property Details',
        ),
        const SidebarXItem(
          icon: Icons.people,
          label: 'Upload Post',
        ),
        const SidebarXItem(
          icon: Icons.favorite,
          label: 'Gallery',
        ),
      ],
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    super.key,
    required this.controller,
  });

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getScreens(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return Scaffold(
              body: pageTitle,
            );
          case 1:
            return Scaffold(
              body: pageTitle,
            );
          case 2:
            return Scaffold(
              body: pageTitle,
            );
          case 3:
            return Scaffold(
              body: pageTitle,
            );
          //   ListView.builder(
          //   padding: const EdgeInsets.only(top: 10),
          //   itemBuilder: (context, index) => Container(
          //     height: 100,
          //     width: double.infinity,
          //     margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(20),
          //       // color: Theme.of(context).canvasColor,
          //       color: Colors.white,
          //       boxShadow: const [BoxShadow()],
          //     ),
          //   ),
          // );

          default:
            return
                //   Text(
                //   pageTitle as String,
                //   style: theme.textTheme.headlineSmall,
                // );
                const WhatsappMsg();
        }
      },
    );
  }
}

Widget _getScreens(int index) {
  switch (index) {
    case 0:
      // return 'Dashboard';
      return const BuyRentFlat();
    case 1:
      // return 'Property Details';
      return const BuyRentFlatProfile();
    case 2:
      // return 'Upload Post';
      return const BuyRentOwner();
    case 3:
      // return 'Gallery';
      return const BuyRentGallery();
    default:
      return const WhatsappMsg();
  }
  /*switch (index) {
    case 0:
      // return 'Dashboard';
      return const BuyRentFlat();
    case 1:
      // return 'Property Details';
      return const BuyRentFlatProfile();
    case 2:
      // return 'Upload Post';
      return const BuyRentOwner();
    case 3:
      // return 'Gallery';
      return const BuyRentGallery();
    // case 4:
    //   return '4 -> Custom iconWidget';
    // case 5:
    //   return 'Profile';
    // case 6:
    //   return 'Settings';
    // default:
    //   return 'Not found page';
  }*/
}

const primaryColor = Color(0xff1b2b4f);
// const canvasColor = Color(0xff1b2b4f);
const scaffoldBackgroundColor = Colors.white;
// const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xff1b2b4f).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);

/*class BuySellMain extends StatelessWidget {
  BuySellMain({super.key});


  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  late String username;

  @override
  void initState() {
    super.initState();
    name();
  }

  void name() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username')!;
    });
  }

  void _logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
    prefs.setString('username', username);
    if(kDebugMode){
      print('UserName is ${prefs.setString('username', username)}');
    }
    Navigator.pushReplacement(context as BuildContext, MaterialPageRoute(builder: (c) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            key: _key,
            appBar: isSmallScreen
                ?
            AppBar(
                    backgroundColor: const Color(0xff1b2b4f),
                    // title: Text(_getTitleByIndex(_controller.selectedIndex)),
                    leading: IconButton(
                      onPressed: () {
                        // if (!Platform.isAndroid && !Platform.isIOS) {
                        //   _controller.setExtended(true);
                        // }
                        _key.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu,color: Colors.white,),
                    ),
              actions: [
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const BuyRentOwnerNew()));
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
                MaterialButton(
                  onPressed: (){
                  _logOut();
                },
                  color: const Color(0xff1b2b4f),
                  child: const Icon(Icons.power_settings_new,color: Colors.white,),
                )
              ],
                  )
                : null,
            drawer: ExampleSidebarX(controller: _controller),
            body: Row(
              children: [
                if (!isSmallScreen) ExampleSidebarX(controller: _controller),
                Expanded(
                  child: Center(
                    child: _ScreensExample(
                      controller: _controller,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    super.key,
    required SidebarXController controller,
  })  : _controller = controller;

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xff1b2b4f),
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xff1b2b4f)),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [Color(0xff1b2b4f),Colors.white],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: Color(0xff1b2b4f),
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/images/avatar.png'),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Dashboard',
          onTap: () {
            debugPrint('Dashboard');
          },
        ),
        const SidebarXItem(
          icon: Icons.list,
          label: 'Property Details',
        ),
        const SidebarXItem(
          icon: Icons.people,
          label: 'Upload Post',
        ),
        const SidebarXItem(
          icon: Icons.favorite,
          label: 'Gallery',
        ),
        // const SidebarXItem(
        //   iconWidget: FlutterLogo(size: 20),
        //   label: 'Flutter',
        // ),
      ],
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    super.key,
    required this.controller,
  });

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getScreens(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return Scaffold(
              body:pageTitle,
            );
          case 1:
            return Scaffold(
              body: pageTitle,
            );
          case 2:
            return Scaffold(
              body: pageTitle,
            );
          case 3:
            return Scaffold(
              body: pageTitle,
            );
            //   ListView.builder(
            //   padding: const EdgeInsets.only(top: 10),
            //   itemBuilder: (context, index) => Container(
            //     height: 100,
            //     width: double.infinity,
            //     margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(20),
            //       // color: Theme.of(context).canvasColor,
            //       color: Colors.white,
            //       boxShadow: const [BoxShadow()],
            //     ),
            //   ),
            // );

          default:
            return
                //   Text(
                //   pageTitle as String,
                //   style: theme.textTheme.headlineSmall,
                // );
                const WhatsappMsg();
        }
      },
    );
  }
}

Widget _getScreens(int index) {
    switch (index) {
    case 0:
      // return 'Dashboard';
      return const BuyRentFlat();
    case 1:
      // return 'Property Details';
      return const BuyRentFlatProfile();
    case 2:
      // return 'Upload Post';
      return const BuyRentOwner();
    case 3:
      // return 'Gallery';
      return const BuyRentGallery();
    default:
      return const WhatsappMsg();
  }
  */ /*switch (index) {
    case 0:
      // return 'Dashboard';
      return const BuyRentFlat();
    case 1:
      // return 'Property Details';
      return const BuyRentFlatProfile();
    case 2:
      // return 'Upload Post';
      return const BuyRentOwner();
    case 3:
      // return 'Gallery';
      return const BuyRentGallery();
    // case 4:
    //   return '4 -> Custom iconWidget';
    // case 5:
    //   return 'Profile';
    // case 6:
    //   return 'Settings';
    // default:
    //   return 'Not found page';
  }*/ /*
}

const primaryColor = Color(0xff1b2b4f);
// const canvasColor = Color(0xff1b2b4f);
const scaffoldBackgroundColor = Colors.white;
// const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xff1b2b4f).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);*/
