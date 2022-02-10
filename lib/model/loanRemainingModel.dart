import 'dart:convert';

LoanRemaining loanRemainingFromJson(String str) =>
    LoanRemaining.fromJson(json.decode(str));

String loanRemainingToJson(LoanRemaining data) => json.encode(data.toJson());

class LoanRemaining {
  LoanRemaining({
    required this.lremaining,
  });

  String lremaining;

  factory LoanRemaining.fromJson(Map<String, dynamic> json) => LoanRemaining(
        lremaining: json["Lremaining"],
      );

  Map<String, dynamic> toJson() => {
        "Lremaining": lremaining,
      };
}
