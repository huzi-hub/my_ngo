// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, unnecessary_string_interpolations, sized_box_for_whitespace

import 'package:flutter/material.dart';
import './headingWidget.dart';
import './ngoProfile.dart';
import 'Services/ngoServices.dart';
import 'models/ngoModel.dart';

class NearbyNGOs extends StatefulWidget {
  const NearbyNGOs({Key? key}) : super(key: key);

  @override
  _NearbyNGOsState createState() => _NearbyNGOsState();
}

class _NearbyNGOsState extends State<NearbyNGOs> {
  List<Ngos>? _ngos;
  Future<void> getNgos() async {
    NGOData ngosData = NGOData(); //= DonorData('abc@gmail.com', '12345678');
    await ngosData.getNgos().then((ngos) => _ngos = ngos);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNgos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          HeadingWidget('Nearby NGOs'),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Text(
              'NGOs Around You',
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
          SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 2,
            primary: false,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 4.0,
            shrinkWrap: true,
            children: <Widget>[
              buildCard(_ngos![0].ngoName, _ngos![0].address, 1),
              buildCard('Edhi', 'Korangi#4 Karachi', 2),
              buildCard('Edhi', 'Korangi#4 Karachi', 3),
              buildCard('Edhi', 'Korangi#4 Karachi', 4),
              buildCard('Edhi', 'Korangi#4 Karachi', 5),
              buildCard('Edhi', 'Korangi#4 Karachi', 6),
            ],
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget buildCard(String name, String address, int cardIndex) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
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
                  color: Colors.blue[800],
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
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0)),
                  ),
                  child: Center(
                      child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NGOProfile()),
                      );
                    },
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
          : EdgeInsets.fromLTRB(25.0, 0.0, 5.0, 10.0),
    );
  }
}
