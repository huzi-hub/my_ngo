// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, unnecessary_string_interpolations, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:my_ngo/nearbyNGOs.dart';
import 'main1.dart';
import 'confirmDonation.dart';
import 'nearbyNGOs1.dart';

class HomePages extends StatelessWidget {
  final donorId;
  const HomePages(this.donorId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                maxRadius: 45,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  maxRadius: 40,
                                  backgroundImage:
                                      AssetImage('assets/images.png'),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(15.0, 0, 0, 0),
                                height: 80,
                                width: 190,
                                child: ListTile(
                                  title: Text(
                                    "Hello There!",
                                    style: TextStyle(
                                      fontSize: 26,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      color: Colors.blue[800],
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: Colors.grey[200],
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Card(
                            color: Colors.white,
                            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: GestureDetector(
                              child: Container(
                                height: 130,
                                width: 280,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      height: 120,
                                      color: Colors.white,
                                      width: 250,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 90,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/pic2.jpg',
                                                          ))),
                                                ),
                                                Text(
                                                  'Donate Food',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          NearbyNgos(donorId,
                                                              'food')));
                                            },
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ), //food doation
                    InkWell(
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Card(
                              color: Colors.white,
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Container(
                                height: 130,
                                width: 280,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      height: 120,
                                      color: Colors.white,
                                      width: 240,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 90,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                      'assets/pic3.jpg',
                                                    ))),
                                          ),
                                          Text(
                                            'Donate Clothes',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    NearbyNgos(donorId, 'clothes')));
                      },
                    ),
                    InkWell(
                      child: Container(
                        height: 180,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Card(
                              color: Colors.white,
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Container(
                                height: 130,
                                width: 280,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Colors.white,

                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      height: 120,

                                      //color if needed

                                      width: 240,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 90,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                      'assets/pic.jpg',
                                                    ))),
                                          ),
                                          InkWell(
                                            child: Text(
                                              'Donate Books',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    NearbyNgos(donorId, 'books')));
                      },
                    ), //book Donation
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
