import 'package:flutter/material.dart';
import 'memberlogin.dart';

class Homekpts extends StatelessWidget {
  const Homekpts({Key? key}) : super(key: key);

  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
        appBar: AppBar(
          title: Text("ผู้ใช้"),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: 370,
                  height: 500,
                  color: Colors.white,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        args.title + args.name + ' ' + args.lname,
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey[850],
                        boxShadow: [
                          BoxShadow(color: Colors.blue, offset: Offset(15, 15))
                        ]),
                  ),
                ),
              ),
            ]));
  }
}
