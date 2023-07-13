import 'dart:async';

import 'package:first_application/screens/bmi.dart';
import 'package:first_application/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => homeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [

            SizedBox(height: 130,),
            Image(
              height: 250,
                image: AssetImage('assets/splash.png')),
          ],
        ),
      ),
      floatingActionButton: Image(width: 100, height: 80, image: AssetImage('assets/load.gif')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
