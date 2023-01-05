// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.zemail,
    required this.xdformat,
    required this.xname,
    required this.xoldpass,
    required this.xpassword,
    required this.xposition,
    required this.xrole,
    required this.xshopno,
    required this.xsp,
    required this.xwh,
    required this.zactive,
    required this.zauserid,
    required this.zid,
  });

  String zemail;
  String xdformat;
  String xname;
  dynamic xoldpass;
  String xpassword;
  dynamic xposition;
  String xrole;
  String xshopno;
  String xsp;
  String xwh;
  String zactive;
  dynamic zauserid;
  int zid;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    zemail: json["zemail"],
    xdformat: json["xdformat"],
    xname: json["xname"],
    xoldpass: json["xoldpass"],
    xpassword: json["xpassword"],
    xposition: json["xposition"],
    xrole: json["xrole"],
    xshopno: json["xshopno"],
    xsp: json["xsp"],
    xwh: json["xwh"],
    zactive: json["zactive"],
    zauserid: json["zauserid"],
    zid: json["zid"],
  );

  Map<String, dynamic> toJson() => {
    "zemail": zemail,
    "xdformat": xdformat,
    "xname": xname,
    "xoldpass": xoldpass,
    "xpassword": xpassword,
    "xposition": xposition,
    "xrole": xrole,
    "xshopno": xshopno,
    "xsp": xsp,
    "xwh": xwh,
    "zactive": zactive,
    "zauserid": zauserid,
    "zid": zid,
  };
}
