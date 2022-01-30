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
        Expanded(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/savingNew.png",
                          width: 100.0,
                          height: 100.0,
                        ),
                        Text(
                          'ข้อมูลเงินกู้',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'ยอดคงเหลือ ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "test",
                                    // args.sumAmount.replaceAllMapped(
                                    //     RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                    //     (Match m) => '${m[1]},'),
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 10, bottom: 10.0),
                        child: Text(
                          'ประจำปี',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'เงินต้น',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'ดอกเบี้ย',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, right: 10, bottom: 10.0),
                        child: Text(
                          'รวม',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ]),
              ),
              Divider(
                  indent: 10,
                  endIndent: 10,
                  color: Color.fromARGB(31, 255, 251, 251)),
              Expanded(
                child: FutureBuilder(
                    future: getLoanInfoApi(args.id),
                    builder: (context, data) {
                      if (data.hasError) {
                        return Center(child: Text("${data.error}"));
                      } else if (data.hasData) {
                        var items = data.data as List<LoanInfoModel>;

                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemExtent: 50,
                          shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            LoanInfoModel myModel = items[index];
                            final lDall = myModel.lDall.replaceAllMapped(
                                RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                (Match m) => '${m[1]},');
                            final t = int.parse(myModel.lDall) +
                                int.parse(myModel.lDinterest);
                            final tt = t.toString();
                            final total = tt.replaceAllMapped(
                                RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                (Match m) => '${m[1]},');
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                        ),
                                        child: Text(
                                          myModel.lddate,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Divider(
                                          thickness: 1, color: Colors.black12),
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
                                      Divider(
                                          thickness: 1, color: Colors.black12),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        myModel.lDinterest,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Divider(
                                          thickness: 1, color: Colors.black12),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        total,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Divider(
                                          thickness: 1, color: Colors.black12),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
