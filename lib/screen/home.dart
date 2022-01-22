import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kptsave/screen/dividend.dart';
import 'package:kptsave/screen/loanInfo.dart';

import 'memberlogin.dart';
import 'settings.dart';
import 'savingInfo.dart';
import 'package:http/http.dart' as http;

class ScreenArgumentsSetting {
  final String password;
  final String nationalId;
  final String phone;
  final String address;
  final String fullname;
  ScreenArgumentsSetting(
      this.password, this.nationalId, this.phone, this.address, this.fullname);
}

class ScreenArgumentsSaving {
  final String id;
  final String sumAmount;

  ScreenArgumentsSaving(this.id, this.sumAmount);
}

class ScreenArgumentsDividend {
  final String id;

  ScreenArgumentsDividend(this.id);
}

class ScreenArgumentsLoan {
  final String id;
  ScreenArgumentsLoan(
    this.id,
  );
}

class ScreenArgumentsLoanData {
  final String id;
  ScreenArgumentsLoanData(this.id);
}

class Homekpts extends StatelessWidget {
  const Homekpts({Key? key}) : super(key: key);

  static const routeName = '/homekpts';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ScreenArgumentsHome;
    final String fullname = args.name + " " + args.lname;
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("หน้าหลัก"),
            automaticallyImplyLeading: false,
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/settings",
                      arguments: ScreenArgumentsSetting(args.password,
                          args.nationalId, args.phone, args.address, fullname));
                },
              )
            ],
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
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://save.kpt.ac.th/assets/profile/' +
                                      args.profilePic),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              args.title + args.name + " " + args.lname,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 13.0),
                              child: Text(
                                args.nationalId,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider(endIndent: 10, thickness: 3, color: Colors.black),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, SavingInfo.routeName,
                                  arguments: ScreenArgumentsSaving(
                                      args.id, args.sumAmount));
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/savingNew.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  'ทุนเรือนหุ้น',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, loankpts.routeName,
                                  arguments: ScreenArgumentsLoan(args.id));
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/loan.png',
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  'หนี้เงินกู้',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Dividendkpt.routeName,
                                  arguments: ScreenArgumentsDividend(args.id));
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/average.png',
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  'ปันผล-เฉลี่ยคืน',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
