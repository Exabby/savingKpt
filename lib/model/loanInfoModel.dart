// To parse this JSON data, do
//
//     final loanInfoModel = loanInfoModelFromJson(jsonString);

import 'dart:convert';

List<LoanInfoModel> loanInfoModelFromJson(String str) =>
    List<LoanInfoModel>.from(
        json.decode(str).map((x) => LoanInfoModel.fromJson(x)));

String loanInfoModelToJson(List<LoanInfoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoanInfoModel {
  LoanInfoModel({
    required this.lid,
    required this.lcapital,
    required this.lamount,
    required this.lsend,
    required this.lguarantor1,
    required this.lguarantor2,
    required this.lguarantor3,
    required this.lrequestDate,
    required this.lapproveDate,
    required this.lremaining,
    required this.lstatus,
    required this.memId,
    required this.lRemark,
  });

  String lid;
  String lcapital;
  String lamount;
  String lsend;
  String lguarantor1;
  String lguarantor2;
  String lguarantor3;
  String lrequestDate;
  String lapproveDate;
  String lremaining;
  String lstatus;
  String memId;
  String lRemark;

  factory LoanInfoModel.fromJson(Map<String, dynamic> json) => LoanInfoModel(
        lid: json["Lid"],
        lcapital: json["Lcapital"],
        lamount: json["Lamount"],
        lsend: json["Lsend"],
        lguarantor1: json["Lguarantor1"],
        lguarantor2: json["Lguarantor2"],
        lguarantor3: json["Lguarantor3"],
        lrequestDate: json["LrequestDate"],
        lapproveDate: json["LapproveDate"],
        lremaining: json["Lremaining"],
        lstatus: json["Lstatus"],
        memId: json["memID"],
        lRemark: json["lRemark"],
      );

  Map<String, dynamic> toJson() => {
        "Lid": lid,
        "Lcapital": lcapital,
        "Lamount": lamount,
        "Lsend": lsend,
        "Lguarantor1": lguarantor1,
        "Lguarantor2": lguarantor2,
        "Lguarantor3": lguarantor3,
        "LrequestDate": lrequestDate,
        "LapproveDate": lapproveDate,
        "Lremaining": lremaining,
        "Lstatus": lstatus,
        "memID": memId,
        "lRemark": lRemark,
      };
}
