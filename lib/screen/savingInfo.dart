// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kptsave/model/savingInfoModel.dart';
import 'package:kptsave/provider/savingInfoProvider.dart';
import 'package:kptsave/screen/home.dart';
import 'package:provider/provider.dart';

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
    print(data);
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
        body: FutureBuilder(
            future: getSavingInfoApi(args.id),
            builder: (context, data) {
              if (data.hasError) {
                return Center(child: Text("${data.error}"));
              } else if (data.hasData) {
                var items = data.data as List<SavingInfoModel>;

                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    SavingInfoModel myModel = items[index];

                    return Column(
                      children: [
                        ListTile(title: Text(myModel.sAmount)),
                      ],
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
