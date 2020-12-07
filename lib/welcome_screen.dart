import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'rounded_button.dart';
import 'package:audioplayers/audio_cache.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:
            EdgeInsets.only(left: 25.0, top: 150.0, right: 25.0, bottom: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.jpeg'),
                    height: 150.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TypewriterAnimatedTextKit(
                  text: ["ERUDITE"],
                  speed: Duration(milliseconds: 1000),
                  totalRepeatCount: 1,
                  textStyle: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 45.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/study.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: TyperAnimatedTextKit(
                        text: ["An Education Portal App"],
                        speed: Duration(milliseconds: 100),
                        textStyle: TextStyle(
                          fontSize: 20.0,
                          color: Colors.green[700],
                          letterSpacing: 3,
                          fontFamily: 'Pacifico',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                      width: 300.0,
                      child: Divider(
                        color: Colors.green[900],
                      ),
                    ),
                    RoundedButton(
                      title: 'Log In',
                      colour: Colors.greenAccent,
                      onPressed: () {
                        final player = AudioCache();
                        player.play('button.mp3');
                        Navigator.pushNamed(context, LoginScreen.id);
                        //Go to login screen.
                      },
                    ),
                    RoundedButton(
                      title: 'Register',
                      colour: Colors.green,
                      onPressed: () {
                        final player = AudioCache();
                        player.play('button.mp3');
                        Navigator.pushNamed(context, RegistrationScreen.id);
                        //Go to login screen.
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
