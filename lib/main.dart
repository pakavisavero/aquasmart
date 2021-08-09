import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:pkm_koi/detail/do.dart';
import 'package:pkm_koi/detail/pakan.dart';
import 'package:pkm_koi/detail/suhu.dart';
import 'package:pkm_koi/detail/tds.dart';
import 'package:pkm_koi/detail/voltage.dart';
import 'package:pkm_koi/model/User.dart';
import 'package:pkm_koi/pages/detail_page.dart';
import 'package:pkm_koi/pages/homepage.dart';
import 'package:pkm_koi/pages/landingpage.dart';
import 'package:pkm_koi/pages/login.dart';
import 'package:pkm_koi/pages/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen(),
      ),
      routes: {
        '/homepage': (context) => Homepage(),
        '/login': (context) => Login(),
        '/do': (context) => DissolvedOxygen(),
        '/pakan': (context) => Pakan(),
        '/suhu': (context) => Suhu(),
        '/tds': (context) => TDS(),
        '/voltage': (context) => Voltage(),
        '/landingpage': (context) => LandingPage(),
        '/detail_page': (context) => DetailPage(),
      },
    );
  }
}
