import 'package:flutter/material.dart';

class Pakan extends StatefulWidget {
  const Pakan({Key key}) : super(key: key);

  @override
  _PakanState createState() => _PakanState();
}

class _PakanState extends State<Pakan> {
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
                'Pakan',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
