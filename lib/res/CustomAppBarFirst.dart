import 'package:buy_sell/screens/BuyRentOwner.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/LoginScreen.dart';

class CustomAppBarFirst extends StatefulWidget {
  const CustomAppBarFirst({super.key});

  @override
  State<CustomAppBarFirst> createState() => _CustomAppBarFirstState();
}

class _CustomAppBarFirstState extends State<CustomAppBarFirst> {
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
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        leading:
        MaterialButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: SizedBox(
              child: Image.asset(
                'assets/images/leftarw.png',
                width: 25,
                fit: BoxFit.fill,
              ),
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
      ),
    );
  }
}
