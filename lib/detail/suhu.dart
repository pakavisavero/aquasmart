import 'package:flutter/material.dart';

class Suhu extends StatefulWidget {
  const Suhu({Key key}) : super(key: key);

  @override
  _SuhuState createState() => _SuhuState();
}

class _SuhuState extends State<Suhu> {
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
                'Suhu',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
