// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_ngo/headingWidget.dart';
import 'package:my_ngo/models/ngoModel.dart';

import 'ngoProfile.dart';

Future<List<Ngos>> fetchPhotos(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://edonations.000webhostapp.com/api-ngo.php'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseNgos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Ngos> parseNgos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Ngos>((json) => Ngos.fromJson(json)).toList();
}

class NearbyNgos extends StatelessWidget {
  int donorId;
  NearbyNgos(this.donorId);
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
              future: fetchPhotos(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('An error has occurred!'),
                  );
                } else if (snapshot.hasData) {
                  return NgoList(donorId: donorId, ngo: snapshot.data!);
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
}

class NgoList extends StatefulWidget {
  const NgoList({Key? key, required this.ngo, required this.donorId})
      : super(key: key);
  final donorId;
  final List<Ngos> ngo;

  @override
  State<NgoList> createState() => _NgoListState();
}

class _NgoListState extends State<NgoList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: widget.ngo.length,
      itemBuilder: (context, index) {
        //print(donorId);
        return buildCard(widget.ngo[index].ngoName, widget.ngo[index].address,
            int.parse(widget.ngo[index].ngoId), index);
      },
    );
  }

  Widget buildCard(String name, String address, int ngoId, int cardIndex) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 7.0,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 12.0),
          Stack(children: <Widget>[
            Container(
              height: 80.0,
              width: 80.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: Colors.blue[800],
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'))),
            ),
          ]),
          const SizedBox(height: 8.0),
          Text(
            name,
            style: const TextStyle(
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            address,
            style: const TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
                color: Colors.grey),
          ),
          const SizedBox(height: 20.0),
          Expanded(
              child: Container(
                  width: 175.0,
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
                                NGOProfile(widget.donorId, ngoId)),
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
