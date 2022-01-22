import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'ifmt.dart';
import 'package:http/http.dart' as http;

import 'memberlogin.dart';

class editPhone extends StatefulWidget {
  const editPhone({Key? key}) : super(key: key);
  static const routeName = '/editphone';
  @override
  _editPhoneState createState() => _editPhoneState();
}

class _editPhoneState extends State<editPhone> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController newPhone = TextEditingController();

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  Future changePhone(id, oldPhone) async {
    var _url = Uri.parse('https://save.kpt.ac.th/changePhoneApi.php');
    if (newPhone.text.length != 10) {
      Fluttertoast.showToast(
          msg: "กรุณาใส่เบอร์โทรให้ถูกต้อง",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (oldPhone == newPhone.text) {
      Fluttertoast.showToast(
          msg: "เบอร์โทรใหม่และเบอร์โทรเก่าไม่สามารถเหมือนกันได้",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (_formKey.currentState!.validate()) {
      var response = await http.post(_url, body: {
        "newPhone": newPhone.text,
        "oldPhone": oldPhone,
        "id": id,
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const MemberLogin(),
        ),
      );
      Fluttertoast.showToast(
          msg: "เปลี่ยนเบอร์โทรสำเร็จ กรุณาเข้าสู่ระบบใหม่อีกครั้ง",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ScreenArgumentsEditPhone;
    final String id = args.nationalId;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('เปลี่ยนเบอร์โทรศัพท์'),
      ),
      body: Stack(children: <Widget>[
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
        Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('เบอร์โทรปัจจุบัน'),
                  subtitle: Text(args.phone),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: newPhone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'โปรดใส่ข้อมูลให้ครบถ้วน';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        labelText: 'เบอร์โทรใหม่',
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
                  onPressed: () => changePhone(args.nationalId, args.phone),
                ),
              ],
            )),
      ]),
    );
  }
}
