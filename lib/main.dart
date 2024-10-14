import 'package:buy_sell/res/CustomBottomNavBar.dart';
import 'package:buy_sell/screens/BuyRentFlat.dart';
import 'package:buy_sell/screens/LoginScreen.dart';
import 'package:buy_sell/screens/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       // home:const BuyRentFlat(),
//       home:const SplashScreen(),
//     );
//   }
// }
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp>{

  bool user = false;

  @override
  void initState() {
    super.initState();
    _initCheck();
  }

  void _initCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('user') != null) {
      setState(() {
        user = prefs.getBool('user')!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(user),
    );
  }
}
