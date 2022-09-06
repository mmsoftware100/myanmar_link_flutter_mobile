import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mmlink/view/login_page.dart';
import 'package:mmlink/view/pre_login_pag.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => PreLoginPage()))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/mmlink_logo.png"),
              Text("The best on the wold",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.red),)
            ],
          ),
        ),
      ),
    );
  }
}
