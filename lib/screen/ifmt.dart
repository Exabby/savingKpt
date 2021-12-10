import 'package:flutter/material.dart';

class informationkpt extends StatefulWidget {
  const informationkpt({Key? key}) : super(key: key);

  @override
  _infomationkptState createState() => _infomationkptState();
}

class _infomationkptState extends State<informationkpt> {
  @override
  Widget build(BuildContext context) {
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
                side: BorderSide(color: Colors.blue)),
          ),
          ListTile(
            title: Text('ชื่อผู้ใช้งาน'),
            subtitle: Text('00000000000000'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
                side: BorderSide(color: Colors.blue)),
          ),
          ListTile(
            title: Text('รหัสผ่าน'),
            subtitle: Text('xxxxxxxxxxx'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
                side: BorderSide(color: Colors.blue)),
          ),
          ListTile(
            title: Text('เบอร์โทรศัพท์'),
            subtitle: Text('xxxxxxxxxxx'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
                side: BorderSide(color: Colors.blue)),
          ),
          ListTile(
            title: Text('ที่อยู่'),
            subtitle: Text('xxxxxxxxxxxxxxxxxxxxxxxxxx'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
                side: BorderSide(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}
