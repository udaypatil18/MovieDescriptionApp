import 'dart:async';

import 'package:descmovies/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desc Movie',
      theme: ThemeData(
        primaryColor: Colors.amberAccent,
        brightness: Brightness.dark
      ),
      home:Splash(),
    );
  }
}

//splash screen
class Splash extends StatefulWidget{
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {

    super.initState();
    goHome();
  }

  //function for splash screen
  goHome(){
    setState(() {
      Timer(
        Duration(seconds: 3),() {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
        }
      );

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
          child: Container(
            color: Colors.amberAccent,
            child: Center(
              child: Icon(FontAwesomeIcons.tv,
              size: 70,
              color: Colors.black,),
            ),
          )),
    );
  }
}