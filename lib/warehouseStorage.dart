// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, unnecessary_string_interpolations, sized_box_for_whitespace, camel_case_types

import 'package:flutter/material.dart';
import 'package:my_ngo/Services/donationServices.dart';
import './donationHistory.dart';
import './headingWidget.dart';

class WarehouseStorage extends StatelessWidget {
  List<DonationData> donations;
  WarehouseStorage(this.donations);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          HeadingWidget('Warehouse Storage'),
          Container(
            height: 150,
            color: Colors.white,
            child: Center(
              child: Text(
                'Available Storage\n 40 kg',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Quicksand', fontSize: 32),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Storage Details',
            style: TextStyle(fontFamily: 'Quicksand', fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 400,
            child: ListView.builder(
                itemCount: donations.length,
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
                        donations[index].toString(),
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text('${donations[index].toString()}'),
                      trailing: Column(children: [
                        Text('Amount'),
                        Text('${donations[index].toString()}')
                      ]),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
