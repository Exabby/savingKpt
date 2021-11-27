// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:kptsave/screen/memberlogin.dart';

import 'screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
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
    // ignore: dead_code
  }
}
