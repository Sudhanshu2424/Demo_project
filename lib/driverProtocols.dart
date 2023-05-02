import 'dart:convert';

import 'package:demo_project/responseDR.dart';
import 'package:flutter/material.dart';
import 'database.dart';
import 'package:uuid/uuid.dart';


class DriverProtocols extends StatefulWidget {
   DriverProtocols({super.key, required this.data, required this.values});

   List<dynamic> data;
   List<bool> values;

   @override
   State<DriverProtocols> createState() => _DriverProtocols();
}


class _DriverProtocols extends State<DriverProtocols>{
  final _formKeyProtocols = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Get Data'),
        ),
        body:Form(
          key: _formKeyProtocols,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Column(
              children: [
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: widget.data.length,
                    padding: const EdgeInsets.all(2.0),
                    itemBuilder: (context, position) {
                      return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              const SizedBox(width: 5),
                              Text(
                                widget.data[position]["categoryname"],
                                style: const TextStyle(fontSize: 15.0),
                              ),
                              Checkbox(
                                checkColor: Colors.greenAccent,
                                activeColor: Colors.green,
                                value: widget.values[position],
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.values[position] = value!;
                                  });
                                },
                              ),
                            ],
                          )
                      );
                    }),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        for (var position=0; position < widget.data.length; position++) {
                          widget.data[position]['Response']=widget.values[position];
                        }

                        // now just send the data to store in database
                        ResponseDR response = ResponseDR(data: jsonEncode(widget.data));
                        await DatabaseHelper.addResponse(response);

                        Navigator.pop(context);
                        var storedData = await DatabaseHelper.getAllResponse();
                        for(var x in storedData!) print(x.data);
                      },
                      child: const Text('Submit Response'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }

}