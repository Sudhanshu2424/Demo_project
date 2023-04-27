import 'dart:convert';

import 'package:http/http.dart' as http;

class BaseClient {
  var client = http.Client();

  //GET
  Future<dynamic> get(String api) async {
    var url = Uri.parse('https://m.dolfin.merucabs.com/api/driver/selfqc/get?source=partner&cabno=MH17N1010');
    var headers = {
      'Accept' : 'application/json',
    };

    var response = await client.get(url, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  //POST
  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse('https://manthandev.merucabs.com/Dispatch/Dispatch/v2/GetPersonProfile');
    var payload = jsonEncode(object);
    var headers = {
      'Content-Type' : 'application/json',
      'Accept' : '*/*',
    };

    var response = await client.post(url, body: payload, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

}