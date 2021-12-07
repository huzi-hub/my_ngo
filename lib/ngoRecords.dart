// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, unnecessary_string_interpolations, sized_box_for_whitespace, camel_case_types

import 'package:flutter/material.dart';
import 'package:my_ngo/headingWidget.dart';

List<String> ngoDetails = ['Edhi', 'Sylani', 'Khidmat e khalq'];

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
              height: 400,
              child: ListView.builder(
                  itemCount: ngoDetails.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                      elevation: 1.0,
                      child: ListTile(
                        leading: Text('${(index + 1).toString()}',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 20,
                            )),
                        title: Text(
                          ngoDetails[index],
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text('Karachi'),
                        trailing: Column(children: [
                          Text('Total Donations Recived'),
                          Text('24')
                        ]),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
