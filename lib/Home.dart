// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, unnecessary_string_interpolations, sized_box_for_whitespace

import 'package:flutter/material.dart';

class HomePagee extends StatelessWidget {
  const HomePagee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      // appBar: AppBar(
      //   iconTheme: IconThemeData(color: Colors.black),
      //   title: Text('Home' , style: TextStyle(color: Colors.black),),
      //   backgroundColor: Colors.amberAccent,
      //   actions: [
      //     CircleAvatar(
      //       radius: 12,
      //       backgroundColor: Color(0xff846B0FFF),
      //       child: Icon(Icons.search),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 5),
      //       child: CircleAvatar(
      //         radius: 12,
      //         backgroundColor: Color(0xff846B0FFF),
      //         child: Icon(Icons.shop),
      //       ),
      //     )
      //   ],
      //
      // ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                  height: 200,
                  child: Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.sort,
                                  size: 50,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                      Container(
                        child: Container(
                            height: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 30.0),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    height: 150,
                                    color: Color(0xff0040ff),
                                    child: Row(
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
                                          padding: EdgeInsets.fromLTRB(
                                              15.0, 0, 0, 0),
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
                                    ))
                              ],
                            ),
                            color: Color(0xff0040ff)),
                      )
                    ],
                  ),
                  color: Color(0xff0040ff)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(String name, String address, int cardIndex) {
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 7.0,
        child: Column(
          children: <Widget>[
            SizedBox(height: 12.0),
            Stack(children: <Widget>[
              Container(
                height: 80.0,
                width: 80.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: Colors.green,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'))),
              ),
            ]),
            SizedBox(height: 8.0),
            Text(
              name,
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              address,
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  color: Colors.grey),
            ),
            SizedBox(height: 20.0),
            Expanded(
                child: Container(
                    width: 175.0,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                    ),
                    child: Center(
                        child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'View Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                    ))))
          ],
        ),
        margin: cardIndex.isEven
            ? EdgeInsets.fromLTRB(10.0, 0.0, 25.0, 10.0)
            : EdgeInsets.fromLTRB(25.0, 0.0, 5.0, 10.0));
  }
}
