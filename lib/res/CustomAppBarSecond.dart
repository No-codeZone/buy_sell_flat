import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/LoginScreen.dart';

class CustomAppBarSecond extends StatefulWidget {
  const CustomAppBarSecond({super.key});

  @override
  State<CustomAppBarSecond> createState() => _CustomAppBarSecondState();
}

class _CustomAppBarSecondState extends State<CustomAppBarSecond> {
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
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading:
        MaterialButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: SizedBox(
              width: widthScreen*0.1,
              child: Image.asset(
                'assets/images/leftarw.png',
                width: 15,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        backgroundColor: const Color(0xff1b2b4f),
        title: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: widthScreen *0.9,
            height: 45.0,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50.0))),
              child:
              TextFormField(
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintText: 'Search...',
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0))),
                ),
              ),
            ),
          ),
        ),
        // centerTitle: true,
        actions: [
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
