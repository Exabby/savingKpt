import 'package:flutter/material.dart';

class editaddresskpt extends StatefulWidget {
  const editaddresskpt({Key? key}) : super(key: key);

  @override
  _addresskptState createState() => _addresskptState();
}

class _addresskptState extends State<editaddresskpt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('แก้ไขที่อยู่'),
      ),
      body: Form(
          child: Column(
        children: <Widget>[
          ListTile(
              title: Text('ที่อยู่ปัจจุบัน'),
              subtitle: Text('xxxxxxx'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
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
            onPressed: () {},
          ),
        ],
      )),
    );
  }
}
