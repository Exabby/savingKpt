import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:kptsave/model/loanInfoModel.dart';
import 'package:http/http.dart' as http;

import 'home.dart';

class loankpts extends StatefulWidget {
  const loankpts({Key? key}) : super(key: key);
  static const routeName = '/loaninfo';
  @override
  _loankptState createState() => _loankptState();
}

class _loankptState extends State<loankpts> {
  @override
  Future<List<LoanInfoModel>> getLoanInfoApi(id) async {
    var _url = Uri.parse('https://save.kpt.ac.th/loanInfoApi.php');
    var response = await http.post(_url, body: {
      "id": id,
    });

    var data = json.decode(response.body);
    var members = <LoanInfoModel>[];

    for (var x in data) {
      members.add(LoanInfoModel.fromJson(x));
    }
    return members;
  }

  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ScreenArgumentsLoan;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ข้อมูลเงินกู้'),
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
        FutureBuilder(
            future: getLoanInfoApi(args.id),
            builder: (context, data) {
              if (data.hasError) {
                return Center(child: Text("${data.error}"));
              } else if (data.hasData) {
                var items = data.data as List<LoanInfoModel>;
                int index = 0;
                LoanInfoModel myModel = items[index];
                final lremaining = myModel.lremaining.replaceAllMapped(
                    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                    (Match m) => '${m[1]},');
                final lDall = myModel.lDall.replaceAllMapped(
                    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                    (Match m) => '${m[1]},');
                final lDinterest = myModel.lDinterest.replaceAllMapped(
                    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                    (Match m) => '${m[1]},');
                return Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/_icon.png",
                              width: 100.0,
                              height: 100.0,
                            ),
                            Text(
                              'ข้อมูลเงินกู้',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'ยอดคงเหลือ',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        lremaining,
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 10.0, bottom: 10.0),
                            child: Text(
                              'วันที่ทำรายการ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                'เงินต้น',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, right: 10.0, bottom: 10.0),
                            child: Text(
                              'ดอกเบี้ย',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                        indent: 10,
                        endIndent: 10,
                        color: Color.fromARGB(31, 255, 251, 251)),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemExtent: 50,
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 40.0),
                                    child: Text(
                                      myModel.lapproveDate,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Divider(thickness: 1, color: Colors.black12),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    lDall,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Divider(thickness: 1, color: Colors.black12),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          lDinterest,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(thickness: 1, color: Colors.black12),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ]),
    );
  }
}
