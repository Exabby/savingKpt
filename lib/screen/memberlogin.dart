import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'home.dart';

class MemberLogin extends StatefulWidget {
  const MemberLogin({Key? key}) : super(key: key);

  @override
  _MemberLoginState createState() => _MemberLoginState();
}

class _MemberLoginState extends State<MemberLogin> {
  TextEditingController _ctrlUsername = TextEditingController();
  TextEditingController _ctrlPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future doLogin() async {
    var _url = Uri.parse('https://save.kpt.ac.th/loginGetApi.php');
    if (_formKey.currentState!.validate()) {
      var response = await http.post(_url, body: {
        "username": _ctrlUsername.text,
        "password": _ctrlPassword.text,
      });
      var data = json.decode(response.body);
      //print(data);
      if (data['status'] == 'Okey') {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Homekpts()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("เข้าสู่ระบบ"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutablesa
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _ctrlUsername,
                validator: (value),
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
                      child: ElevatedButton(
                          onPressed: () => doLogin(), child: Text('Login'))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
