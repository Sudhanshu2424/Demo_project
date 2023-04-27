import 'dart:convert';


class UserModle{
  String? Hwdeviceid;
  String? auth;

  UserModle(this.Hwdeviceid,this.auth);

  UserModle.fromJson(Map<String, dynamic> json) {
    Hwdeviceid= json['Hwdeviceid'];
    auth= json['auth'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Hwdeviceid'] = this.Hwdeviceid!;
    data['auth'] = this.auth!;
    return data;
  }
}