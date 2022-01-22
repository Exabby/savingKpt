import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'home.dart';

class ScreenArgumentsHome {
  final String title;
  final String name;
  final String lname;
  final String gender;
  final String profilePic;
  final String nationalId;
  final String id;
  final String password;
  final String phone;
  final String address;
  final String sumAmount;

  ScreenArgumentsHome(
      this.title,
      this.name,
      this.lname,
      this.gender,
      this.profilePic,
      this.nationalId,
      this.id,
      this.password,
      this.phone,
      this.address,
      this.sumAmount);
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
            arguments: ScreenArgumentsHome(
                data['title'],
                data['name'],
                data['lname'],
                data['gender'],
                data['profilePic'],
                data['nationalID'],
                data['id'],
                data['password'],
                data['phone'],
                data['address'],
                data['sumAmount']));
      } else if (data['status'] == 'No') {
        Fluttertoast.showToast(
            msg: "รหัสผ่านหรือชื่อผู้ใช้ผิด กรุณาลองใหม่อีกครั้ง",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text("เข้าสู่ระบบ"),
            automaticallyImplyLeading: false,
          ),
          body: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: _ctrlUsername,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Username';
                      }
                      return null;
                    },
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
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
                              onPressed: () => doLogin(),
                              child: Text('Login'))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
