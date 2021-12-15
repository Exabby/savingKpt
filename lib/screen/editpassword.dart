import 'package:flutter/material.dart';

class passwordkpt extends StatefulWidget {
  const passwordkpt({Key? key}) : super(key: key);

  @override
  _passwordkptState createState() => _passwordkptState();
}

class _passwordkptState extends State<passwordkpt> {
  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
          ),
        ],
      )),
    );
  }
}
