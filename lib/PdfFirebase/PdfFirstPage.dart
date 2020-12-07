import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:erudite/PdfFirebase/PdfModal.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'PdfSecondPage.dart';

class PdfFirstPage extends StatefulWidget {
  @override
  _PdfFirstPageState createState() => _PdfFirstPageState();
}

class _PdfFirstPageState extends State<PdfFirstPage> {
  List<Modal> itemList = List();
  final mainReference = FirebaseDatabase.instance.reference().child('Database');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text('Previous Year Question Papers')),
      ),
      body: itemList.length == 0
          ? Text("Loading")
          : ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: GestureDetector(
                    onTap: () {
                      String passData = itemList[index].link;
                      Navigator.push(
                          (context),
                          MaterialPageRoute(
                              builder: (context) => ViewPdf(),
                              settings: RouteSettings(
                                arguments: passData,
                              )));
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('images/bdesign.jpg'),
                            fit: BoxFit.cover,
                          )),
                        ),
                        Center(
                          child: Container(
                            height: 140,
                            child: Card(
                              margin: EdgeInsets.all(18),
                              elevation: 7.0,
                              child: Center(
                                child: Text(itemList[index].name +
                                    " " +
                                    (index + 1).toString()),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getPdfAndUpload();
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  Future getPdfAndUpload() async {
    var rng = new Random();
    String randomName = "";
    for (var i = 0; i < 20; i++) {
      print(rng.nextInt(100));
      randomName += rng.nextInt(100).toString();
    }
    File file = await FilePicker.getFile(type: FileType.custom);
    String fileName = '${randomName}.pdf';
    savePdf(file.readAsBytesSync(), fileName);
  }

  savePdf(List<int> asset, String name) async {
    StorageReference reference = FirebaseStorage.instance.ref().child(name);
    StorageUploadTask uploadTask = reference.putData(asset);
    String url = await (await uploadTask.onComplete).ref.getDownloadURL();
    documentFileUpload(url);
  }

  String CreateCryptoRandomString([int length = 32]) {
    final Random _random = Random.secure();
    var values = List<int>.generate(length, (i) => _random.nextInt(256));
    return base64Url.encode(values);
  }

  void documentFileUpload(String str) {
    var data = {
      "PDF": str,
      "FileName": "My new question paper",
    };
    mainReference.child(CreateCryptoRandomString()).set(data).then((v) {
      print("StoreSuccessfully");
    });
  }

  @override
  void initState() {
    mainReference.once().then((DataSnapshot snap) {
      var data = snap.value;

      itemList.clear();
      data.forEach((key, value) {
        Modal m = new Modal(value['PDF'], value['FileName']);
        itemList.add(m);
      });
      setState(() {});
    });
  }
}
