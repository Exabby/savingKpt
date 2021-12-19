// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:kptsave/model/savingInfoModel.dart';
import 'package:kptsave/screen/home.dart';

class SavingInfo extends StatelessWidget {
  const SavingInfo({Key? key}) : super(key: key);

  static const routeName = '/savinginfo';

  Future<List<SavingInfoModel>> getSavingInfoApi(id) async {
    var _url = Uri.parse('https://save.kpt.ac.th/savingInfoGetApi.php');
    var response = await http.post(_url, body: {
      "id": id,
    });

    var data = json.decode(response.body);
    var members = <SavingInfoModel>[];

    for (var x in data) {
      members.add(SavingInfoModel.fromJson(x));
    }
    return members;
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ScreenArgumentsSaving;

    return Scaffold(
        appBar: AppBar(
          title: const Text("ข้อมูลออมทรัพย์"),
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
          Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/savingNew.png",
                        width: 100.0,
                        height: 100.0,
                      ),
                      Text(
                        'ทุนเรือนหุ้น',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'ยอดเงินรวมทั้งหมด ' + args.sumAmount + ' บาท',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
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
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 20.0, bottom: 10.0),
                    child: Text(
                      'ประจำปี',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 110.0, bottom: 10.0),
                    child: Text(
                      'วันที่',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 115.0, bottom: 10.0),
                    child: Text(
                      'จำนวนเงิน',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ]),
              ),
              Divider(thickness: 0, color: Color.fromARGB(31, 255, 255, 255)),
              FutureBuilder(
                  future: getSavingInfoApi(args.id),
                  builder: (context, data) {
                    if (data.hasError) {
                      return Center(child: Text("${data.error}"));
                    } else if (data.hasData) {
                      var items = data.data as List<SavingInfoModel>;

                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemExtent: 50,
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) {
                          SavingInfoModel myModel = items[index];
                          final amount = myModel.sAmount.replaceAllMapped(
                              RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                              (Match m) => '${m[1]},');
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 40.0),
                                      child: Text(
                                        myModel.syear,
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
                                      myModel.sDate,
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
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Text(
                                            amount,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
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
            ],
          ),
        ]));
  }
}
