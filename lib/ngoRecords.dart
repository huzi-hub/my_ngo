// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, unnecessary_string_interpolations, sized_box_for_whitespace, camel_case_types

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_ngo/headingWidget.dart';
import 'package:my_ngo/models/ngoModel.dart';
import 'package:http/http.dart' as http;

// List<String> ngoDetails = ['Edhi', 'Sylani', 'Khidmat e khalq'];

class NGORecords extends StatefulWidget {
  @override
  _NGORecordsState createState() => _NGORecordsState();
}

class _NGORecordsState extends State<NGORecords> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            HeadingWidget('NGO Records'),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: FutureBuilder<List<Ngos>>(
                future: fetchNgos(http.Client()),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('An error has occurred!'),
                    );
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 5),
                            elevation: 1.0,
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                child: Expanded(
                                    child: Text(snapshot.data![index].ngoName)),
                              ),
                              title: Text(
                                snapshot.data![index].ngoName,
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 20,
                                ),
                              ),
                              subtitle: Text('${snapshot.data![index].email}'),
                              trailing: Column(children: [
                                Text(snapshot.data![index].address),
                                Text(snapshot.data![index].city),
                              ]),
                            ),
                          );
                        });
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Ngos>> fetchNgos(http.Client client) async {
    const String url = 'https://edonations.000webhostapp.com/api-ngo.php';

    var result = await http.get(Uri.parse(url));
    if (result.statusCode == 200) {
      final parsed = json.decode(result.body).cast<Map<String, dynamic>>();
      return parsed.map<Ngos>((json) => Ngos.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Ngos');
    }
  }
}
