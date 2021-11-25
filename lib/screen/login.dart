import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:kptsave/screen/home.dart';
import 'dart:io';
import 'dart:async';

class Loginkpts extends StatelessWidget {
  TextEditingController _ctrlUsername = TextEditingController();
  TextEditingController _ctrlPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future doLogin() async {
    var _url = Uri.parse('https://save.kpt.ac.th/loginGetApi.php');
    if (_formKey.currentState!.validate()) {
      var response = await http.post(_url, body: {
        "username": _ctrlUsername.text,
        "password": _ctrlPassword.text,
      });
      var data = json.decode(response.body);
      //print(data);a
      if (data['status'] == 'Okey') {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Homekpts()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {}
}
