import 'package:flutter/material.dart';
import 'package:kptsave/screen/memberlogin.dart';
import 'package:kptsave/screen/settings.dart';
import 'screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KPSave',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MemberLogin(),
      routes: {
        Homekpts.routeName: (context) => const Homekpts(),
      },
    );
  }
}
