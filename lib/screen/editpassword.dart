import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'ifmt.dart';
import 'package:http/http.dart' as http;

class passwordkpt extends StatefulWidget {
  const passwordkpt({Key? key}) : super(key: key);
  static const routeName = '/password';
  @override
  _passwordkptState createState() => _passwordkptState();
}

class _passwordkptState extends State<passwordkpt> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController OldPassword = TextEditingController();
  TextEditingController NewPassword = TextEditingController();
  TextEditingController ConfirmPassword = TextEditingController();

  Future changePassword() async {
    if (NewPassword == ConfirmPassword) {
      var _url = Uri.parse('https://save.kpt.ac.th/changePasswordApi.php');
      if (_formKey.currentState!.validate()) {
        var response = await http.post(_url, body: {
          "oldPass": OldPassword.text,
          "newPass": NewPassword.text,
        });
        var data = json.decode(response.body);

        if (data['status'] == 'Okay') {}
      }
    } else {
      Fluttertoast.showToast(
          msg: "UserName & Password Incorrect!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  static const routeName = '/editpass';
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ScreenArgumentsEditPass;
    final String id = args.id;
    final String password = args.password;
    return Scaffold(
      appBar: AppBar(
        title: const Text('แก้ไขรหัสผ่าน'),
      ),
      body: Form(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: OldPassword,
              decoration: InputDecoration(
                  fillColor: Colors.white70,
                  filled: true,
                  labelText: 'รหัสผ่านเก่า',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: NewPassword,
              decoration: InputDecoration(
                  fillColor: Colors.white70,
                  filled: true,
                  labelText: 'รหัสผ่านใหม่',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: ConfirmPassword,
              decoration: InputDecoration(
                  fillColor: Colors.white70,
                  filled: true,
                  labelText: 'ยืนยันรหัสผ่าน',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          MaterialButton(
            height: 58,
            minWidth: 380,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10)),
            child: Text(
              'ยืนยัน',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            color: Color(0xFF1A237E),
            onPressed: () => changePassword(),
          ),
        ],
      )),
    );
  }
}
