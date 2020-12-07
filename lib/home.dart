import 'package:erudite/uploadmain.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'subjects.dart';
import 'package:audioplayers/audio_cache.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('HOME'),
          ),
          backgroundColor: Colors.green,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/book.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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
                      child: Image.asset('images/notes.jpg'),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        final player = AudioCache();
                        player.play('button.mp3');
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Image.asset('images/oldbooks.jpg'),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                        onPressed: () {
                          final player = AudioCache();
                          player.play('button.mp3');
                          Navigator.pushNamed(context, PdfScreen.id);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Image.asset('images/papers.jpg'),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        onPressed: () {
                          final player = AudioCache();
                          player.play('button.mp3');
                          Navigator.pushNamed(context, ChatScreen.id);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Image.asset('images/portal.jpg'),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
