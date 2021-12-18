import 'package:flutter/material.dart';
import 'package:kptsave/screen/editpassword.dart';
import 'package:kptsave/screen/settings.dart';
import 'home.dart';

class ScreenArgumentsEditPass {
  final String password;
  final String nationalId;
  ScreenArgumentsEditPass(this.password, this.nationalId);
}

class informationkpt extends StatefulWidget {
  const informationkpt({Key? key}) : super(key: key);
  static const routeName = '/infomation';
  @override
  _infomationkptState createState() => _infomationkptState();
}

class _infomationkptState extends State<informationkpt> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ScreenArgumentsInfo;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ข้อมูลส่วนตัว'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('ชื่อ-สกุล'),
            subtitle: Text('ชือออออออออ'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
                side: BorderSide(color: Colors.black)),
          ),
          ListTile(
            title: Text('ชื่อผู้ใช้งาน'),
            subtitle: Text('00000000000000'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
                side: BorderSide(color: Colors.black)),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, passwordkpt.routeName,
                  arguments:
                      ScreenArgumentsEditPass(args.password, args.nationalId));
            },
            title: Text('รหัสผ่าน'),
            subtitle: Text('xxxxxxxxxxx'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
                side: BorderSide(color: Colors.black)),
          ),
          ListTile(
            title: Text('เบอร์โทรศัพท์'),
            subtitle: Text('xxxxxxxxxxx'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
                side: BorderSide(color: Colors.black)),
          ),
          ListTile(
            title: Text('ที่อยู่'),
            subtitle: Text('xxxxxxxxxxxxxxxxxxxxxxxxxx'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
                side: BorderSide(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
