import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iottive/pages/home.dart';
import 'package:iottive/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

bool finalIsLogin = false;

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    getLoginData().whenComplete(() async {
      print(finalIsLogin);
      // Timer(Duration(seconds: 0), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  (finalIsLogin == null || finalIsLogin == false)
                      ? Login()
                      : Home_Page()));
      // });
      // });
      super.initState();
    });
  }

  Future getLoginData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool islogin = prefs.getBool("isLogin");
    if (!mounted) return;
    setState(() {
      finalIsLogin = islogin;
    });
    print(finalIsLogin);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.purpleAccent,
        primarySwatch: Colors.purple,
      ),
      home: (finalIsLogin == null || finalIsLogin == false)
          ? Login()
          : Home_Page(),
    );
  }
}
