import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/dividendModel.dart';
import 'home.dart';

class Dividendkpt extends StatefulWidget {
  const Dividendkpt({Key? key}) : super(key: key);

  static const routeName = '/Dividend';
  @override
  _DividendkptState createState() => _DividendkptState();
}

Future<List<DividendInfoModel>> getDividendInfoApi(id) async {
  var _url = Uri.parse('https://save.kpt.ac.th/dividendGetApi.php');
  var response = await http.post(_url, body: {
    "id": id,
  });

  var data = json.decode(response.body);
  var members = <DividendInfoModel>[];

  for (var x in data) {
    members.add(DividendInfoModel.fromJson(x));
  }
  return members;
}

class _DividendkptState extends State<Dividendkpt> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ScreenArgumentsDividend;
    getDividendInfoApi(args.id);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ปันผลเฉลี่ย'),
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
                      "assets/images/_icon.png",
                      width: 100.0,
                      height: 100.0,
                    ),
                    Text(
                      'ปันผล - เฉลี่ยคืน',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Container(
              alignment: FractionalOffset.center,
              decoration: BoxDecoration(color: Colors.red),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
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
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'ปันผล',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      'เฉลี่ยคืน',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      'รวมทั้งหมด',
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
            Expanded(
                child: FutureBuilder(
                    future: getDividendInfoApi(args.id),
                    builder: (context, data) {
                      if (data.hasError) {
                        return Center(child: Text("${data.error}"));
                      } else if (data.hasData) {
                        var items = data.data as List<DividendInfoModel>;

                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemExtent: 50,
                          shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            DividendInfoModel myModel = items[index];
                            final t = int.parse(myModel.divLoantotal) +
                                int.parse(myModel.divSavingtotal);
                            final tt = t.toString();
                            final total = tt.replaceAllMapped(
                                RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                (Match m) => '${m[1]},');
                            final divSavingtotal = myModel.divSavingtotal
                                .replaceAllMapped(
                                    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                    (Match m) => '${m[1]},');
                            final divLoantotal = myModel.divLoantotal
                                .replaceAllMapped(
                                    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                    (Match m) => '${m[1]},');
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        myModel.divDate,
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
                                        divSavingtotal,
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
                                        divLoantotal,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Text(
                                              total,
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
                    })),
          ],
        ),
      ]),
    );
  }
}
