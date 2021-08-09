import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pkm_koi/pages/landingpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool value = prefs.getBool('login');

    Timer(Duration(seconds: 3), () {
      if (value == true) {
        Navigator.pushNamed(context, '/homepage');
      } else {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => LandingPage()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFf4530b2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo here
            Image.asset(
              'assets/beginning-page/spot-robot.png',
              height: 200,
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
