import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kptsave/screen/dividend.dart';
import 'package:kptsave/screen/editPhone.dart';
import 'package:kptsave/screen/editpassword.dart';
import 'package:kptsave/screen/ifmt.dart';
import 'package:kptsave/screen/loan.dart';
import 'package:kptsave/screen/memberlogin.dart';
import 'package:kptsave/screen/settings.dart';
import 'screen/home.dart';
import 'screen/savingInfo.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
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
        SavingInfo.routeName: (context) => const SavingInfo(),
        settingskpt.routeName: (context) => const settingskpt(),
        informationkpt.routeName: (context) => const informationkpt(),
        passwordkpt.routeName: (context) => const passwordkpt(),
        editPhone.routeName: (context) => const editPhone(),
        loankpts.routeName: (context) => const loankpts(),
      },
    );
  }
}
