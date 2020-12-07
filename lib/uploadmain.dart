import 'package:flutter/material.dart';
import 'PdfFirebase/PdfFirstPage.dart';
import 'package:audioplayers/audio_cache.dart';

class PdfScreen extends StatefulWidget {
  static const String id = 'pdf_screen';
  @override
  _PdfScreenState createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PdfFirstPage(),
    );
  }
}
