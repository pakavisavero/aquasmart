import 'package:flutter/material.dart';

class TDS extends StatefulWidget {
  const TDS({Key key}) : super(key: key);

  @override
  _TDSState createState() => _TDSState();
}

class _TDSState extends State<TDS> {
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
                'Total Dissolved Oxygen',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
