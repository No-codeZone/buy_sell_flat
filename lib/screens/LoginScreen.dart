import 'dart:async';

import 'package:buy_sell/screens/RoughMenuScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'BuyRentFlat.dart';
import 'MakeCall.dart';
import 'menuSrcnRough.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;

  bool isLoading = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: const Color(0xffe8e8e8),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: screenHeight * 0.3,
                width: screenWidth * 0.25,
                child: Lottie.asset('animations/processing.json',
                    height: screenHeight * 0.3, width: screenWidth * 0.25),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Welcome back!',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Login to your existent account of Society Prime',
                style: TextStyle(fontSize: 10.0, color: Color(0xff807e7e)),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: SizedBox(
                  height: 45.0,
                  child: TextFormField(
                    style: const TextStyle(color: Color(0xff1b2b4f)),
                    controller: emailController,
                    decoration: const InputDecoration(
                        hintText: 'User Name',
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 25.0,right: 5.0),
                          child: Icon(Icons.person),
                        ),
                        labelText: 'User Name',
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff1b2b4f)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        prefixIconColor: Color(0xff7c7b7b),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff1b2b4f)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: SizedBox(
                  height: 45.0,
                  child: TextFormField(
                    obscureText: _obscureText,
                    controller: passwordController,
                    style: const TextStyle(color: Color(0xff1b2b4f)),
                    decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 25.0,right: 5.0),
                          child: Icon(Icons.key_sharp),
                        ),
                        labelText: 'Password',
                        fillColor: Colors.white,
                        prefixIconColor: const Color(0xff7c7b7b),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff1b2b4f)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        /*suffixIcon: IconButton(
                          icon: Icon(
                            _passwordInVisible ? Icons.visibility_off : Icons.visibility, //change icon based on boolean value
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordInVisible = !_passwordInVisible; //change boolean value
                            });
                          },
                        ),*/
                        suffixIcon: MaterialButton(
                          onPressed: () {
                            _toggle();
                          },
                          child: Icon(
                            !_obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xff7c7b7b),
                          ),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff1b2b4f)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forgot Password ?',
                  style: TextStyle(fontSize: 10.0, color: Color(0xff1b2b4f)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                height: 45.0,
                minWidth: screenWidth * 0.5,
                onPressed: () {
                  /*if (emailController.text == "12345" &&
                      passwordController.text == "Pass@123") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BuyRentFlat()),
                    );
                  }
                  else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Invalid Credentials',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Color(0xff0b3093),
                      ),
                    );
                  }*/
                  if(kDebugMode){
                    print('LoginScreen Login button clicked !');
                  }
                  _login();
                },
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                color: const Color(0xff0b3093),
                child: const Text(
                  'LOG IN',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            'Or connect using',
            style: TextStyle(color: Color(0xff807e7e)),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                height: 45.0,
                minWidth: screenWidth * 0.2,
                onPressed: () {},
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                color: const Color(0xff0b3093),
                child: Row(
                  children: [
                    Container(
                      width: 15.0,
                      height: 15.0,
                      decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.0))),
                      child: SizedBox(
                        height: 15.0,
                        width: 15.0,
                        child: Image.asset('assets/images/fblg.png'),
                      ),
                    ),
                    const Text(
                      'Facebook',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              MaterialButton(
                height: 45.0,
                minWidth: screenWidth * 0.2,
                onPressed: () {},
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                color: const Color(0xffad4d4d),
                child: Row(
                  children: [
                    Container(
                      width: 15.0,
                      height: 15.0,
                      decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.0))),
                      child: SizedBox(
                        height: 15.0,
                        width: 15.0,
                        child: Image.asset('assets/images/googlelg.jpg'),
                      ),
                    ),
                    const Text(
                      'Facebook',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> _login() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Future.delayed(const Duration(seconds: 1), () {
        if(kDebugMode){
          print('test');
        }
        if (emailController.text.trim() == "12345" &&
            passwordController.text.trim() == "Pass@123") {
          if(kDebugMode){
            print('test2');
          }
          prefs.setBool('user', true);
          prefs.setString('username', "12345");
          // prefs.setString('password', "Pass@123");
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => SellBuyMain()));
              // MaterialPageRoute(builder: (context) => const RoughMenuBar()));
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) => const MyMenuBar(message: 'hello world!',)));
        } else {
          if(kDebugMode){
            print('test3');
          }
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Invalid Credentials',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Color(0xff0b3093),
            ),
          );
        }
      });
    }else {
      if(kDebugMode){
        print('test4');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Empty Fields',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xff0b3093),
        ),
      );
    }
  }
}
