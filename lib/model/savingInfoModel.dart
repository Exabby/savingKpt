// To parse this JSON data, do
//
//     final savingInfoModel = savingInfoModelFromJson(jsonString);

import 'dart:convert';

List<SavingInfoModel> savingInfoModelFromJson(String str) =>
    List<SavingInfoModel>.from(
        json.decode(str).map((x) => SavingInfoModel.fromJson(x)));

String savingInfoModelToJson(List<SavingInfoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SavingInfoModel {
  SavingInfoModel({
    required this.sId,
    required this.syear,
    required this.sround,
    required this.sDate,
    required this.sAmount,
    required this.sStatus,
    required this.memId,
    required this.pId,
  });

  String sId;
  String syear;
  String sround;
  String sDate;
  String sAmount;
  String sStatus;
  String memId;
  String pId;

  factory SavingInfoModel.fromJson(Map<String, dynamic> json) =>
      SavingInfoModel(
        sId: json["sId"],
        syear: json["syear"],
        sround: json["sround"],
        sDate: json["sround"],
        sAmount: json["sAmount"],
        sStatus: json["sStatus"],
        memId: json["memID"],
        pId: json["pID"],
      );

  Map<String, dynamic> toJson() => {
        "sId": sId,
        "syear": syear,
        "sround": sround,
        "sDate": sDate,
        "sAmount": sAmount,
        "sStatus": sStatus,
        "memID": memId,
        "pID": pId,
      };
}
