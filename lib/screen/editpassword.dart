import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kptsave/screen/memberlogin.dart';
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

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  Future changePassword(id, password) async {
    if (NewPassword.text == ConfirmPassword.text) {
      var _url = Uri.parse('https://save.kpt.ac.th/changePasswordApi.php');
      if (_formKey.currentState!.validate()) {
        var response = await http.post(_url, body: {
          "oldPass": OldPassword.text,
          "newPass": NewPassword.text,
          "id": id,
        });
        var data = json.decode(response.body);
        data = data["affectedRow"].toString();
        print("ผลลัพธ์   : " +
            generateMd5(OldPassword.text) +
            "  และ : " +
            generateMd5(OldPassword.text));

        if (generateMd5(OldPassword.text) != password) {
          Fluttertoast.showToast(
              msg: "กรุณาใส่รหัสผ่านให้ถูกต้อง",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        } else if (generateMd5(NewPassword.text) == password) {
          Fluttertoast.showToast(
              msg: "รหัสผ่านใหม่และรหัสผ่านเก่าไม่สามารถเหมือนกันได้",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              webPosition: "left",
              fontSize: 16.0);
        } else if (data == "1") {
          Fluttertoast.showToast(
              msg: "เปลี่ยนรหัสผ่านสำเร็จ กรุณาเข้าสู่ระบบใหม่อีกครั้ง",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MemberLogin()),
          );
        }
      }
    } else if (NewPassword.text != ConfirmPassword.text) {
      Fluttertoast.showToast(
          msg: "รหัสผ่านใหม่ไม่ตรงกัน",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "เป็นไรไม่รู้",
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
    final String id = args.nationalId;
    final String password = args.password;
    return Scaffold(
      appBar: AppBar(
        title: const Text('แก้ไขรหัสผ่าน'),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: OldPassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'โปรดใส่ข้อมูลให้ครบถ้วน';
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'โปรดใส่ข้อมูลให้ครบถ้วน';
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'โปรดใส่ข้อมูลให้ครบถ้วน';
                    }
                    return null;
                  },
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
                  onPressed: () {
                    changePassword(args.nationalId, args.password);
                  }),
            ],
          )),
    );
  }
}
