import 'package:flutter/material.dart';

class PostMessageDisplay extends StatelessWidget {
  const PostMessageDisplay({super.key, required this.data});

  final Map<String,dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Get Data'),
        ),
        body:Column(
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text('Person name'),
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data["person"].length,
                padding: const EdgeInsets.all(2.0),
                itemBuilder: (context, position) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        '${data["person"][position]["name"]}',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      // onTap: () => _onTapItem(context, article[position]),
                    ),
                  );
                }),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text('spname'),
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data["sp"].length,
                padding: const EdgeInsets.all(2.0),
                itemBuilder: (context, position) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        '${data["sp"][position]["mentorname"]}',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      // onTap: () => _onTapItem(context, article[position]),
                    ),
                  );
                }),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text('Car model'),
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data["car"].length,
                padding: const EdgeInsets.all(2.0),
                itemBuilder: (context, position) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        '${data["car"][position]["make"]}',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      // onTap: () => _onTapItem(context, article[position]),
                    ),
                  );
                }),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text('sitename'),
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data["spsite"].length,
                padding: const EdgeInsets.all(2.0),
                itemBuilder: (context, position) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        '${data["spsite"][position]["sitename"]}',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      // onTap: () => _onTapItem(context, article[position]),
                    ),
                  );
                }),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text('Driver name'),
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data["driver"].length,
                padding: const EdgeInsets.all(2.0),
                itemBuilder: (context, position) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        '${data["driver"][position]["name"]}',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      // onTap: () => _onTapItem(context, article[position]),
                    ),
                  );
                }),
          ],
        )
    );
  }

}