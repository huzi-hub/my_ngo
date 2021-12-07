// ignore_for_file: file_names, prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class DonationType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: 590,
      child: Column(
        children: [
          Container(
            height: 100,
            child: Card(
                elevation: 10,
                child: Center(
                    child: Text(
                  'Select Donation Type',
                  style: TextStyle(fontSize: 28),
                ))),
          ),
          SizedBox(
            height: 50,
          ),
          Card(
              child: Column(
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {},
                  child: Center(
                      child: Text(
                    'Food Donation',
                    style: TextStyle(fontSize: 28, height: 4),
                  ))),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Center(
                      child: Text(
                    'Books Donation',
                    style: TextStyle(
                      fontSize: 28,
                      height: 4,
                    ),
                  ))),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Center(
                      child: Row(children: [
                    Text(
                      'Clothes Donation',
                      style: TextStyle(fontSize: 28, height: 4),
                    ),
                  ]))),
            ],
          )),
        ],
      ),
    ));
  }
}
