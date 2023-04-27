import 'dart:convert';
import 'package:flutter/material.dart';
import 'base_client.dart';
import 'user.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Column(
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Text('Welcome $email'),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Go back!"),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  var response = await BaseClient().get('/users').catchError((err) {
                    debugPrint('Error in server response! Error : $err');
                  });
                  if (response == null) return;
                  debugPrint('successful:');

                  var users = json.decode(response);
                  debugPrint('Data received: $users');
                },
                child: const Text("GET"),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {

                  var body = {
                  'Hwdeviceid': 'b44c4918a258c422',
                  'auth': 'FA4BE2EC77E17BDAE0531800A8C0D2E1'
                  };

                  UserModle user = UserModle.fromJson(body);

                  var response = await BaseClient().post('/users', user).catchError((err) {
                    debugPrint('Error in posting updates to server! Error : $err');
                  });
                  if (response == null) {
                    debugPrint('Unsuccessful, Data - $response');
                    return;
                  }
                  debugPrint('successful:');
                  var users = json.decode(response);
                  debugPrint('Data received: $users');
                },
                child: const Text("POST"),
              ),
            ),
          ],
        ));
  }
}