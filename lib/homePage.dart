import 'dart:convert';
import 'package:flutter/material.dart';
import 'baseClient.dart';
import 'user.dart';
import 'driverProtocols.dart';


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

                  if (response == null){
                    debugPrint('Data not received form server');
                    return;
                  }

                  var users = json.decode(response);
                  if(users["code"]!="200"){
                    debugPrint('Data not received\nResponse status ${users["status"]}\nResponse message ${users["message"]}');
                  }
                  else {
                    debugPrint('Successfully data received');
                  }

                  // debugPrint('Data received: $data');

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DriverProtocols(
                          data: users["data"],
                        )),
                  );

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