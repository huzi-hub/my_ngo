// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_ngo/headingWidget.dart';
import 'package:my_ngo/models/ngoModel.dart';
import 'package:geocoding/geocoding.dart';
import 'ngoProfile.dart';

Future<List<Ngos>> fetchNGOs(http.Client client) async {
  final response = await client
      .post(Uri.parse('https://edonations.000webhostapp.com/api-ngo.php'));
  // Use the compute function to run parseNgos in a separate isolate.
  return compute(parseNgos, response.body);
}

// A function that converts a response body into a List<Ngos>.
List<Ngos> parseNgos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Ngos>((json) => Ngos.fromJson(json)).toList();
}

class NearbyNgos extends StatefulWidget {
  int donorId;
  String fow;
  NearbyNgos(this.donorId, this.fow);
  @override
  State<NearbyNgos> createState() => _NearbyNgosState();
}

int distance = 0;

class _NearbyNgosState extends State<NearbyNgos> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          HeadingWidget('Nearby NGOs'),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: const Text(
              'NGOs Around You',
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            margin: const EdgeInsets.only(top: 10),
            child: FutureBuilder<List<Ngos>>(
              future: fetchNGOs(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('An error has occurred!'),
                  );
                } else if (snapshot.hasData) {
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var distance =
                            calculateDistance(snapshot.data![index].address);
                        print('Distance is : ${distance} ${index}');
                        if (distance >= 0) {
                          return buildCard(
                              snapshot.data![index].ngoName,
                              snapshot.data![index].address,
                              snapshot.data![index].ngoId,
                              index,
                              distance);
                        } else {
                          return SizedBox();
                        }
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
    );
  }

  Widget buildCard(
      String name, String address, String ngoId, int cardIndex, int distance) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 7.0,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 12.0),
          Stack(children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: Colors.blue[800],
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'))),
            ),
          ]),
          const SizedBox(height: 8.0),
          FittedBox(
            child: Text(
              name,
              style: const TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          FittedBox(
            child: Text(
              address,
              style: const TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  color: Colors.grey),
            ),
          ),
          const SizedBox(height: 20.0),
          Expanded(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.blue[800],
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0)),
                  ),
                  child: Center(
                      child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                NGOProfile(widget.donorId, int.parse(ngoId))),
                      );
                    },
                    child: const Text(
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
          ? const EdgeInsets.fromLTRB(10.0, 0.0, 25.0, 10.0)
          : const EdgeInsets.fromLTRB(25.0, 0.0, 5.0, 10.0),
    );
  }
}

Position? _currentUserPosition;
double? distanceImMeter = 0.0;
List<Ngos> ngodata = [];
int calculateDistance(String address) {
  int distanceInKm;
  int distance;
  locationFromAddress(address).then((result) async {
    _currentUserPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double ngolat = result[0].latitude;
    double ngolng = result[0].longitude;
    distanceImMeter = Geolocator.distanceBetween(
      _currentUserPosition!.latitude,
      _currentUserPosition!.longitude,
      ngolat,
      ngolng,
    );
  });
  distance = distanceImMeter!.round().toInt();
  distanceInKm = (distance / 1000).round().toInt();
  //print(distance);
  return distanceInKm;
}
