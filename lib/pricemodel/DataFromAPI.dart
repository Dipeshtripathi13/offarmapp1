// ignore_for_file: file_names

import 'dart:convert';
//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class DataFromAPI extends StatefulWidget {
  const DataFromAPI({Key? key}) : super(key: key);

  @override
  _DataFromAPIState createState() => _DataFromAPIState();
}

class _DataFromAPIState extends State<DataFromAPI> {
  Future getUserData() async {
    var response = await http
        .get(Uri.parse('http://10.0.2.2:8000/ptarkalis/?format=json'));
    //    await http.get(Uri.http(127.0.0.1:8000, employees));
    var jsonData = json.decode(response.body);
    List<User> users = [];

    for (var u in jsonData) {
      User user = User(u["tarkaliname"], u["tarkalicode"], u["tarkaliprice"]);
      users.add(user);
    }
//print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Price Today"),
      ),
      body: Card(
        child: FutureBuilder(
          future: getUserData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: Text('Loading...'),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    var id = snapshot.data[i].tarkaliprice;

                    return ListTile(
                      title: Text(
                        snapshot.data[i].tarkaliname,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                      trailing: Text(
                        ' Rs $id /Kg',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.red),
                      ),
                      // trailing: Text(snapshot.data[i].tarkalicode),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}

class User {
  final String tarkaliname;
  final int tarkalicode;
  final double tarkaliprice;

  User(this.tarkaliname, this.tarkalicode, this.tarkaliprice);
}
