import 'package:pocket_docker/docker_run.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'Page1.dart';

import 'IP.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/IP': (context) => IPCheck(),
        '/Run': (context) => Run(),
        '/Page1': (context) => Page1(),
      }, //192.168.43.161
      home: Splash(),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      backgroundColor: Colors.lightBlue[100],
      seconds: 7,
      navigateAfterSeconds: IPCheck(),
      title: Text(
        'More Of Docker',
        textScaleFactor: 2,
      ),
      image: Image.asset('assets/images/tenor.gif'),
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.indigoAccent[700],
    );
  }
}
