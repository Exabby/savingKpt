import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kptsave/screen/ifmt.dart';
import 'package:http/http.dart' as http;

import 'memberlogin.dart';

class editaddresskpt extends StatefulWidget {
  const editaddresskpt({Key? key}) : super(key: key);
  static const routeName = '/editAddress';
  @override
  _addresskptState createState() => _addresskptState();
}

TextEditingController newAddress = TextEditingController();
final _formKey = GlobalKey<FormState>();

class _addresskptState extends State<editaddresskpt> {
  Future changeAddressApi(id, oldAddress) async {
    var _url = Uri.parse('https://save.kpt.ac.th/changeAddressApi.php');
    if (_formKey.currentState!.validate()) {
      var response = await http.post(_url, body: {
        "newAddress": newAddress.text,
        "oldAddress": oldAddress,
        "id": id,
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const MemberLogin(),
        ),
      );
      Fluttertoast.showToast(
          msg: "เปลี่ยนที่อยู่สำเร็จ กรุณาเข้าสู่ระบบใหม่อีกครั้ง",
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
        ModalRoute.of(context)!.settings.arguments as ScreenArgumentsAddress;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('แก้ไขที่อยู่'),
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
                    title: Text('ที่อยู่ปัจจุบัน'),
                    subtitle: Text(args.address),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: newAddress,
                    decoration: InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        labelText: 'ที่อยู่ใหม่',
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
                    if (newAddress.text == args.address) {
                      Fluttertoast.showToast(
                          msg: "ที่อยู่ใหมและที่อยู่เก่าไม่สามารถเหมือนกันได้",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      changeAddressApi(args.nationalId, args.address);
                    }
                  },
                ),
              ],
            )),
      ]),
    );
  }
}
