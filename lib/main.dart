import 'package:erudite/home.dart';
import 'package:erudite/subjects.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'welcome_screen.dart';
import 'registration_screen.dart';
import 'chat_screen.dart';
import 'home.dart';
import 'subjects.dart';
import 'dart:async';
import 'package:splashscreen/splashscreen.dart';
import 'uploadmain.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MyApp());

class Erudite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        SubjectScreen.id: (context) => SubjectScreen(),
        PdfScreen.id: (context) => PdfScreen(),
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Splash2(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: Erudite(),
      title: new Text(
        'WELCOME',
        style: TextStyle(
            fontFamily: 'Pacifico',
            fontWeight: FontWeight.w600,
            fontSize: 15,
            letterSpacing: 5,
            color: Colors.black87),
        textScaleFactor: 3,
      ),
      image: Image.asset('images/splogo.png'),
      loadingText: Text("Loading"),
      photoSize: 150.0,
      loaderColor: Colors.blue,
    );
  }
}
