import 'package:flutter/material.dart';

class Voltage extends StatefulWidget {
  const Voltage({Key key}) : super(key: key);

  @override
  _VoltageState createState() => _VoltageState();
}

class _VoltageState extends State<Voltage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.popAndPushNamed(context, '/homepage');
                },
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
              SizedBox(width: 30),
              Text(
                'Voltage',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
