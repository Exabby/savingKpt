import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class settingskpt extends StatefulWidget {
  const settingskpt({Key? key}) : super(key: key);

  @override
  _settingskptState createState() => _settingskptState();
}

class _settingskptState extends State<settingskpt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< Updated upstream
      appBar: AppBar(
        title: const Text("settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Expanded(
                child: ElevatedButton(
                    onPressed: () => doLogin(), child: Text('Login'))),
          ],
        ),
      ),
=======
        appBar: AppBar(
      title: const Text("settings"),
    ),
    body: MaterialButton(onPressed: (){}
    child: Text("เกี่ยวกับ" style: TextStyle(fontSize:20, color: Color.black,
    ),
    ),),
>>>>>>> Stashed changes
    );
  }
}
