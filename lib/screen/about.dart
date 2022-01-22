import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class aboutphone extends StatefulWidget {
  const aboutphone({Key? key}) : super(key: key);

  @override
  _aboutphoneState createState() => _aboutphoneState();
}

class _aboutphoneState extends State<aboutphone> {
  @override
  Widget build(BuildContext context) {
    String osVersion = Platform.operatingSystemVersion;
    return Scaffold(
        appBar: AppBar(
          title: const Text('เกี่ยวกับ'),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 255, 253, 228),
                  Color.fromARGB(255, 0, 90, 167),
                ],
              )),
            ),
            ListView(children: <Widget>[
              ListTile(
                leading: Icon(Icons.tablet_android_rounded),
                title: Text("Android Version : " + osVersion),
              ),
            ])
          ],
        ));
  }
}
