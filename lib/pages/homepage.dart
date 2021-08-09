import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pkm_koi/api/notification_api.dart';
import 'package:pkm_koi/detail/do.dart';
import 'package:pkm_koi/detail/pakan.dart';
import 'package:pkm_koi/detail/suhu.dart';
import 'package:pkm_koi/detail/tds.dart';
import 'package:pkm_koi/detail/voltage.dart';
import 'package:pkm_koi/model/DataIkan.dart';
import 'package:pkm_koi/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final fb = FirebaseDatabase.instance;
  dynamic data;
  int _selectedNavbar = 0;
  String routes;

  @override
  Widget build(BuildContext context) {
    final DatabaseReference ref = fb.reference().child('data');
    var size = MediaQuery.of(context).size;

    Widget loadingProgress = SizedBox(
      height: MediaQuery.of(context).size.height / 1.3,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );

    void _changeSelectedNavBar(int index) {
      setState(() {
        _selectedNavbar = index;
      });
    }

    Future logoutUser() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('login', false);
    }

    Widget mainBody() {
      return Container(
        margin: EdgeInsets.only(top: 35),
        child: ListView(
          children: [
            StreamBuilder(
              stream: ref.onValue,
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    !snapshot.hasError &&
                    snapshot.data.snapshot.value != null) {
                  data = DataIkan.fromJson(snapshot.data.snapshot.value);
                  print(snapshot.data.snapshot.value);

                  return Center(
                    child: Container(
                      width: size.width * 0.85,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text(
                                  'Hi, User',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  AuthServices().signOut();
                                  await logoutUser();
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      '/login',
                                      (Route<dynamic> route) => false);
                                },
                                child: Text('Logout',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          GestureDetector(
                            onTap: () => NotificationApi.showNotifications(
                              title: 'Savero Pakavi Z',
                              body: 'Hey, DO were bla bla bla',
                              payload: 'savero.abs',
                            ),
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: size.height * 0.09 / 3, left: 20),
                              width: double.infinity,
                              height: size.height * 0.09,
                              decoration: BoxDecoration(
                                color: Color(0xff5450d6),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'Kondisi Wi-Fi : Connected',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            margin: EdgeInsets.only(left: 15, right: 15),
                            child: Container(
                              child: Text(
                                'Daily Review',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Wrap(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    routes = 'do';
                                  });
                                },
                                child: dataSensor("Dissolved Oxygen",
                                    data.dissolved.toString() + " ppm", 130),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    routes = 'suhu';
                                  });
                                },
                                child: dataSensor(
                                    "Suhu", data.suhu.toString() + '° C', 130),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    routes = 'suhu';
                                  });
                                },
                                child: dataSensor(
                                    "TDS", data.tds.toString() + " g/L", 130),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    routes = 'voltage';
                                  });
                                },
                                child: dataSensor(
                                  "Voltage",
                                  data.voltage.toString() + " V",
                                  130,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    routes = 'pakan';
                                  });
                                },
                                child: dataSensor(
                                  "Sumber Daya",
                                  data.daya == 1 ? 'PLTS' : 'PLN',
                                  130,
                                  isWhite: true,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  Future.delayed(const Duration(milliseconds: 3000), () {
                    setState(() {
                      loadingProgress = SizedBox(
                        height: MediaQuery.of(context).size.height / 1.2,
                        child: Center(
                          child: Container(
                            width: size.width * 0.6,
                            child: Text(
                              'Please check your internet connectivity!',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    });
                    return loadingProgress;
                  });
                  return loadingProgress;
                }
              },
            ),
          ],
        ),
      );
    }

    Widget changeRoute() {
      if (routes == 'do') {
        return DissolvedOxygen();
      } else if (routes == 'suhu') {
        return Suhu();
      } else if (routes == 'tds') {
        return TDS();
      } else if (routes == 'voltage') {
        return Voltage();
      } else if (routes == 'pakan') {
        return Pakan();
      }
      return mainBody();
    }

    return Scaffold(
      backgroundColor: Color(0xFF4530b2),
      body: changeRoute(),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Color(0xFF4530b2),
              textTheme: Theme.of(context).textTheme.copyWith(
                  caption: new TextStyle(
                      color: Colors.yellow))), // sets the inactive col
          child: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            iconSize: 30,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment),
                label: 'Pesanan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.mail),
                label: 'Inbox',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Akun',
              ),
            ],
            currentIndex: _selectedNavbar,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: _changeSelectedNavBar,
          ),
        ),
      ),
    );
  }

  Padding dataSensor(String desc, dynamic data, double height, {bool isWhite}) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        width: size.width * 0.4,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              isWhite != true ? Color(0xff5450d6) : Colors.white,
              isWhite != true ? Color(0xff5450d6) : Colors.white,
            ],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: Column(
            children: [
              Text(
                data,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isWhite != true ? Colors.white : Color(0xFF4530b2),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                desc,
                style: TextStyle(
                  fontSize: 16,
                  color: isWhite != true ? Colors.white : Color(0xFF4530b2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
