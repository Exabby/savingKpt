import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kptsave/screen/about.dart';
import 'package:kptsave/screen/ifmt.dart';

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
        body: ListView(children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (contrxt) {
                return aboutphone();
              }));
            },
            leading: Icon(Icons.tablet_android_rounded),
            title: Text('เกี่ยวกับ'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (contrxt) {
                return informationkpt();
              }));
            },
            leading: Icon(Icons.account_circle_rounded),
            title: Text('ข้อมูลส่วนตัว'),
          )
        ]));
  }
}
