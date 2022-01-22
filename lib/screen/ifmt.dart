import 'package:flutter/material.dart';
import 'package:kptsave/screen/editaddress.dart';
import 'package:kptsave/screen/editpassword.dart';
import 'package:kptsave/screen/settings.dart';
import 'editPhone.dart';

class ScreenArgumentsEditPass {
  final String password;
  final String nationalId;
  final String phone;
  final String address;
  ScreenArgumentsEditPass(
      this.password, this.nationalId, this.phone, this.address);
}

class ScreenArgumentsEditPhone {
  final String phone;
  final String nationalId;
  ScreenArgumentsEditPhone(this.phone, this.nationalId);
}

class ScreenArgumentsAddress {
  final String address;
  final String nationalId;
  ScreenArgumentsAddress(this.address, this.nationalId);
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
      body: Stack(
        children: [
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
          ListView(
            children: [
              ListTile(
                title: Text('ชื่อ-สกุล'),
                subtitle: Text(args.fullname),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    side: BorderSide(color: Colors.black)),
              ),
              Divider(thickness: 1, color: Colors.black12),
              ListTile(
                title: Text('ชื่อผู้ใช้งาน'),
                subtitle: Text(args.nationalId),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    side: BorderSide(color: Colors.black)),
              ),
              Divider(thickness: 1, color: Colors.black12),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, passwordkpt.routeName,
                      arguments: ScreenArgumentsEditPass(args.password,
                          args.nationalId, args.phone, args.address));
                },
                title: Text('รหัสผ่าน'),
                subtitle: Text('แก้ใขรหัสผ่าน'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    side: BorderSide(color: Colors.black)),
              ),
              Divider(thickness: 1, color: Colors.black12),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, editPhone.routeName,
                      arguments: ScreenArgumentsEditPhone(
                          args.phone, args.nationalId));
                },
                title: Text('เบอร์โทรศัพท์'),
                subtitle: Text(args.phone),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    side: BorderSide(color: Colors.black)),
              ),
              Divider(thickness: 1, color: Colors.black12),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, editaddresskpt.routeName,
                      arguments: ScreenArgumentsAddress(
                          args.address, args.nationalId));
                },
                title: Text('ที่อยู่'),
                subtitle: Text(args.address),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    side: BorderSide(color: Colors.black)),
              ),
              Divider(thickness: 1, color: Colors.black12),
            ],
          ),
        ],
      ),
    );
  }
}
