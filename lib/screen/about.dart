import 'package:flutter/material.dart';

class aboutphone extends StatefulWidget {
  const aboutphone({Key? key}) : super(key: key);

  @override
  _aboutphoneState createState() => _aboutphoneState();
}

class _aboutphoneState extends State<aboutphone> {
  @override
  Widget build(BuildContext context) {
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
          ],
        ));
  }
}
