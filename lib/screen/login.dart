// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_final_fields, unused_field
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/scheduler.dart';

class Loginkpts extends StatelessWidget {
  TextEditingController _ctrlUsername = TextEditingController();
  TextEditingController _ctrlPassword = TextEditingController();

  Future doLongin() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("เข้าสู่ระบบนาจา"),
      ),
      body: Form(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            Text('เข้าสู่ระบบ'),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _ctrlUsername,
                decoration: InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    labelText: 'ชื่อผู้เข้าใช้',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _ctrlPassword,
                obscureText: true,
                decoration: InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    labelText: 'รหัสผ่าน',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Colors.green[600],
                      textColor: Colors.white,
                      onPressed: () {},
                      child: Text('เข้าสู่ระบบ'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
