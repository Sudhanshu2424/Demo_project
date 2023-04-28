import 'package:flutter/material.dart';

class DriverProtocols extends StatelessWidget {
   const DriverProtocols({super.key, required this.data});

  final List<dynamic> data;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Get Data'),
        ),
        body:Container(
          child: ListView.builder(
          itemCount: data.length,
          padding: const EdgeInsets.all(2.0),
          itemBuilder: (context, position) {
          return Card(
          child: ListTile(
          title: Text(
          '${data[position]["categoryname"]}',
          style: TextStyle(
          fontSize: 18.0,
          color: Colors.black,
          fontWeight: FontWeight.bold),
          ),
          // onTap: () => _onTapItem(context, article[position]),
          ),
          );
          }),
        )
        );
  }

}