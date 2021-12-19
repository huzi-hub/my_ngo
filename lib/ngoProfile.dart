// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, unnecessary_string_interpolations, sized_box_for_whitespace, camel_case_types

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_ngo/models/ngoModel.dart';
import './chatScreen.dart';
import './confirmDonation.dart';
import './headingWidget.dart';

class NGOProfile extends StatefulWidget {
  int donorId;
  int ngoId;
  final desc;
  final name;
  NGOProfile(this.donorId, this.ngoId, this.desc, this.name);
  @override
  _NGOProfileState createState() => _NGOProfileState();
}

class _NGOProfileState extends State<NGOProfile> {
  int photoIndex = 0;

  List<String> photos = [
    'assets/NGO image1.jpg',
    'assets/NGO image2.jpg',
    'assets/NGO image3.jpg',
  ];
  void _previousImage() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
    });
  }

  void _nextImage() {
    setState(() {
      photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : photoIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          HeadingWidget(widget.name),
          Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    image: DecorationImage(
                        image: AssetImage(photos[photoIndex]),
                        fit: BoxFit.fill)),
                height: 210.0,
              ),
              Positioned(
                top: 190.0,
                left: 25.0,
                right: 25.0,
                child: SelectedPhoto(photos.length, photoIndex),
              ),
              GestureDetector(
                child: Container(
                  height: 200.0,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent,
                ),
                onTap: _nextImage,
              ),
              GestureDetector(
                child: Container(
                  height: 210.0,
                  width: MediaQuery.of(context).size.width / 2,
                  color: Colors.transparent,
                ),
                onTap: _previousImage,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Description',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 240,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            padding: EdgeInsets.only(left: 10),
            child: RichText(
              text: TextSpan(
                text: widget.desc,
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },
              child: Icon(Icons.chat),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ConfirmDonation(widget.donorId, widget.ngoId)),
                    );
                  },
                  child: Text(
                    'Donate now!',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ))),
        ],
      ),
    );
  }
}

class SelectedPhoto extends StatelessWidget {
  final int numberOfDots;
  final int photoIndex;

  SelectedPhoto(this.numberOfDots, this.photoIndex);

  Widget _inactivePhoto() {
    return new Container(
        child: new Padding(
      padding: const EdgeInsets.only(left: 3.0, right: 3.0),
      child: Container(
        height: 8.0,
        width: 8.0,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(4.0)),
      ),
    ));
  }

  Widget _activePhoto() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey, spreadRadius: 1.0, blurRadius: 2.0)
              ]),
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];

    for (int i = 0; i < numberOfDots; ++i) {
      dots.add(i == photoIndex ? _activePhoto() : _inactivePhoto());
    }

    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }

  Future<List<Ngos>> fetchNGOs(http.Client client, String fow) async {
    var data = {'field_of_work': fow};
    final response = await client.post(
        Uri.parse('https://edonations.000webhostapp.com/api-ngo.php'),
        body: jsonEncode(data));
    // Use the compute function to run parseNgos in a separate isolate.
    return compute(parseNgos, response.body);
  }

// A function that converts a response body into a List<Ngos>.
  List<Ngos> parseNgos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Ngos>((json) => Ngos.fromJson(json)).toList();
  }
}
