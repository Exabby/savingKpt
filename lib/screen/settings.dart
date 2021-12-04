import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class settingskpt extends StatefulWidget {
  const settingskpt({Key? key}) : super(key: key);

  @override
  _settingskptState createState() => _settingskptState();
}

class _settingskptState extends State<settingskpt> {
  // const SecondRoute({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("settings"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  // Expanded(
                  // child: ElevatedButton(
                  // onPressed: (), child: Text('Login'))),
                ],
              ),
            ), //your elements here
          ],
        ));
  }
}
