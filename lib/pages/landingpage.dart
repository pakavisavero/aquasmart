import 'package:flutter/material.dart';
import 'package:pkm_koi/pages/homepage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff3450e9),
                  Color(0xff5450d6),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: size.height * 0.4),
            child: Center(
              child: Image.asset(
                'assets/beginning-page/spot-robot.png',
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    color: Colors.grey,
                    height: 3,
                    width: 100,
                  ),
                  SizedBox(height: 40),
                  Text('Aplikasi Ikan Koi',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      'Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi eveniet libero quis perferendis expedita, beatae, itaque deserunt eum facilis necessitatibus, alias ad recusandae repudiandae! Cum praesentium eligendi omnis voluptas libero.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, height: 1.5),
                    ),
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Homepage();
                      }));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFf4530b2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 13),
                        child: Text(
                          'Get Started',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
