import 'dart:ffi';

import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'package:audioplayers/audio_cache.dart';

class SubjectScreen extends StatefulWidget {
  static const String id = 'subjects_screen';
  @override
  _SubjectScreenState createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('SUBJECTS'),
          ),
          backgroundColor: Colors.green,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/subjects.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                        onPressed: () {
                          final player = AudioCache();
                          player.play('button.mp3');
                          Navigator.pushNamed(context, SubjectScreen.id);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Image.asset('images/maths.jpg'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: FlatButton(
                          onPressed: () {
                            final player = AudioCache();
                            player.play('button.mp3');
                            Navigator.pushNamed(context, SubjectScreen.id);
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Image.asset('images/phy.jpg'),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                        onPressed: () {
                          final player = AudioCache();
                          player.play('button.mp3');
                          Navigator.pushNamed(context, SubjectScreen.id);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Image.asset('images/chem.jpg'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
