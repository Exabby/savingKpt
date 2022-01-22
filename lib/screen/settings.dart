import 'package:flutter/material.dart';
import 'package:kptsave/screen/about.dart';
import 'package:kptsave/screen/ifmt.dart';

import 'home.dart';

class ScreenArgumentsInfo {
  final String password;
  final String nationalId;
  final String phone;
  final String address;
  final String fullname;
  ScreenArgumentsInfo(
      this.password, this.nationalId, this.phone, this.address, this.fullname);
}

class settingskpt extends StatefulWidget {
  const settingskpt({Key? key}) : super(key: key);
  static const routeName = '/settings';

  @override
  _settingskptState createState() => _settingskptState();
}

class _settingskptState extends State<settingskpt> {
  // const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ScreenArgumentsSetting;

    return Scaffold(
        appBar: AppBar(
          title: const Text("ตั้งค่า"),
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
                  Navigator.pushNamed(context, informationkpt.routeName,
                      arguments: ScreenArgumentsInfo(
                          args.password,
                          args.nationalId,
                          args.phone,
                          args.address,
                          args.fullname));
                },
                leading: Icon(Icons.account_circle_rounded),
                title: Text('ข้อมูลส่วนตัว'),
              )
            ])
          ],
        ));
  }
}
