import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'home.dart';

class ScreenArguments {
  final String title;
  final String name;
  final String lname;
  final String gender;

  ScreenArguments(
    this.title,
    this.name,
    this.lname,
    this.gender,
  );
}

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
    MaterialApp(
      routes: {
        Homekpts.routeName: (context) => const Homekpts(),
      },
    );
    var _url = Uri.parse('https://save.kpt.ac.th/loginGetApi.php');
    if (_formKey.currentState!.validate()) {
      var response = await http.post(_url, body: {
        "username": _ctrlUsername.text,
        "password": _ctrlPassword.text,
      });
      var data = json.decode(response.body);

      if (data['status'] == 'Okay') {
        Navigator.pushNamed(context, Homekpts.routeName,
            arguments: ScreenArguments(
                data['title'], data['name'], data['lname'], data['gender']));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("เข้าสู่ระบบ"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _ctrlUsername,
                validator: (value) {},
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
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () => doLogin(), child: Text('Sign Up'))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
