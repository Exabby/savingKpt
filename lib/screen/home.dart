import 'package:flutter/material.dart';

class Homekpts extends StatelessWidget {
  const Homekpts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ผู้ใช้"),
        ),
        body: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Container(
                  width: 370,
                  height: 500,
                  color: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[850],
                        boxShadow: [
                          BoxShadow(color: Colors.blue, offset: Offset(15, 15))
                        ]),
                  )),
            )));
  }
}
