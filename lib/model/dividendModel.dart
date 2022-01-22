// To parse this JSON data, do
//
//     final dividendInfoModel = dividendInfoModelFromJson(jsonString);

import 'dart:convert';

List<DividendInfoModel> dividendInfoModelFromJson(String str) =>
    List<DividendInfoModel>.from(
        json.decode(str).map((x) => DividendInfoModel.fromJson(x)));

String dividendInfoModelToJson(List<DividendInfoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DividendInfoModel {
  DividendInfoModel({
    required this.divId,
    required this.divDate,
    required this.divYear,
    required this.divSavingAmount,
    required this.divSavingPercent,
    required this.divLoanAmount,
    required this.divLoanPercent,
    required this.divSavingtotal,
    required this.divLoantotal,
    required this.memId,
    required this.pId,
  });

  String divId;
  String divDate;
  String divYear;
  String divSavingAmount;
  String divSavingPercent;
  String divLoanAmount;
  String divLoanPercent;
  String divSavingtotal;
  String divLoantotal;
  String memId;
  String pId;

  factory DividendInfoModel.fromJson(Map<String, dynamic> json) =>
      DividendInfoModel(
        divId: json["divID"],
        divDate: json["divDate"],
        divYear: json["divYear"],
        divSavingAmount: json["divSavingAmount"],
        divSavingPercent: json["divSavingPercent"],
        divLoanAmount: json["divLoanAmount"],
        divLoanPercent: json["divLoanPercent"],
        divSavingtotal: json["divSavingtotal"],
        divLoantotal: json["divLoantotal"],
        memId: json["memID"],
        pId: json["pID"],
      );

  Map<String, dynamic> toJson() => {
        "divID": divId,
        "divDate": divDate,
        "divYear": divYear,
        "divSavingAmount": divSavingAmount,
        "divSavingPercent": divSavingPercent,
        "divLoanAmount": divLoanAmount,
        "divLoanPercent": divLoanPercent,
        "divSavingtotal": divSavingtotal,
        "divLoantotal": divLoantotal,
        "memID": memId,
        "pID": pId,
      };
}
