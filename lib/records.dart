import 'package:flutter/material.dart';
import 'custom_icons_icons.dart';

class Records extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 48.0),
          child: Text(
            'Sleep Tracker',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 32,),
          CircleAvatar(
            backgroundColor: Colors.yellow[800],
            radius: 22,
            child: Icon(
              CustomIcons.moon,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
