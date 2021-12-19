// ignore_for_file: file_names
// // ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, unnecessary_string_interpolations, sized_box_for_whitespace

// import 'package:flutter/material.dart';
// import './headingWidget.dart';
// import './ngoProfile.dart';
// import 'Services/ngoServices.dart';
// import 'models/ngoModel.dart';
// import 'package:http/http.dart' as http;

// class NearbyNGOs extends StatefulWidget {
//   const NearbyNGOs({Key? key}) : super(key: key);

//   @override
//   _NearbyNGOsState createState() => _NearbyNGOsState();
// }

// class _NearbyNGOsState extends State<NearbyNGOs> {
//   late Future<List<Ngos>> futureNgos;

//   @override
//   void initState() {
//     super.initState();
//     futureNgos = NGOData().fetchNgos(http.Client());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(children: <Widget>[
//         SizedBox(
//           height: 40,
//         ),
//         Container(
//           padding: EdgeInsets.only(left: 25, right: 25),
//           child: Text(
//             'NGOs Around You',
//             style: TextStyle(
//                 fontFamily: 'Quicksand',
//                 fontSize: 14.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey),
//           ),
//         ),
//         SizedBox(height: 10),
//         Expanded(
//           child: GridView.count(
//             crossAxisCount: 2,
//             primary: false,
//             crossAxisSpacing: 2.0,
//             mainAxisSpacing: 4.0,
//             shrinkWrap: true,
//             children: <Widget>[
//               // FutureBuilder<List<Ngos>>(
//               //   future: futurengo,
//               //   builder: (context, snapshot) {
//               //     if (snapshot.hasData) {
//               //       return Text(snapshot.data![0].ngoName);
//               //     } else if (snapshot.hasError) {
//               //       return Text('${snapshot.error}');
//               //     }

//               //     // By default, show a loading spinner.
//               //     return const CircularProgressIndicator();
//               //   },
//               // ),
//               FutureBuilder<List<Ngos>>(
//                 future: futureNgos,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasError) {
//                     return const Center(
//                       child: Text('An error has occurred!'),
//                     );
//                   } else if (snapshot.hasData) {
//                     return buildCard(snapshot.data![0].ngoName, 'address', 1);
//                   } else {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                 },
//               ),

//               //buildCard(_ngos![0].ngoName, _ngos![0].address, 1),
//               buildCard('Edhi', 'Korangi#4 Karachi', 2),
//               buildCard('Edhi', 'Korangi#4 Karachi', 3),
//               buildCard('Edhi', 'Korangi#4 Karachi', 4),
//               buildCard('Edhi', 'Korangi#4 Karachi', 5),
//               buildCard('Edhi', 'Korangi#4 Karachi', 6),
//             ],
//           ),
//         ),
//       ]),
//     );
//   }

//   // ignore: non_constant_identifier_names
//   Widget buildCard(String name, String address, int cardIndex) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//       elevation: 7.0,
//       child: Column(
//         children: <Widget>[
//           SizedBox(height: 12.0),
//           Stack(children: <Widget>[
//             Container(
//               height: 80.0,
//               width: 80.0,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(40.0),
//                   color: Colors.blue[800],
//                   image: DecorationImage(
//                       image: NetworkImage(
//                           'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'))),
//             ),
//           ]),
//           SizedBox(height: 8.0),
//           Text(
//             name,
//             style: TextStyle(
//               fontFamily: 'Quicksand',
//               fontWeight: FontWeight.bold,
//               fontSize: 15.0,
//             ),
//           ),
//           SizedBox(height: 5.0),
//           Text(
//             address,
//             style: TextStyle(
//                 fontFamily: 'Quicksand',
//                 fontWeight: FontWeight.bold,
//                 fontSize: 12.0,
//                 color: Colors.grey),
//           ),
//           SizedBox(height: 20.0),
//           Expanded(
//               child: Container(
//                   width: 175.0,
//                   decoration: BoxDecoration(
//                     color: Colors.blue[800],
//                     borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(10.0),
//                         bottomRight: Radius.circular(10.0)),
//                   ),
//                   child: Center(
//                       child: TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => NGOProfile()),
//                       );
//                     },
//                     child: Text(
//                       'View Profile',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontFamily: 'Quicksand',
//                       ),
//                     ),
//                   ))))
//         ],
//       ),
//       margin: cardIndex.isEven
//           ? EdgeInsets.fromLTRB(10.0, 0.0, 25.0, 10.0)
//           : EdgeInsets.fromLTRB(25.0, 0.0, 5.0, 10.0),
//     );
//   }
// }





//---------------------------------------Calculate Distance----------------------------------------------

//int distance = 0;

// class NgoList extends StatefulWidget {
//   const NgoList({Key? key, required this.ngo, required this.donorId})
//       : super(key: key);
//   final donorId;
//   final List<Ngos> ngo;

//   @override
//   State<NgoList> createState() => _NgoListState();
// }

// class _NgoListState extends State<NgoList> {
//   @override
//   Widget build(BuildContext context) {
//     //var distance = 0;
//     return GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//         ),
//         itemCount: widget.ngo.length,
//         itemBuilder: (context, index) {
//           var distance = calculateDistance(widget.ngo[index].address);
//           print('Distance is : ${distance} ${index}');
//           if (distance > 0) {
//             return buildCard(
//                 widget.ngo[index].ngoName,
//                 widget.ngo[index].address,
//                 int.parse(widget.ngo[index].ngoId),
//                 index,
//                 distance);
//           } else {
//             return SizedBox();
//           }
//         });
//   }

//   Widget buildCard(
//       String name, String address, int ngoId, int cardIndex, int distance) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//       elevation: 7.0,
//       child: Column(
//         children: <Widget>[
//           const SizedBox(height: 12.0),
//           Stack(children: <Widget>[
//             Container(
//               height: MediaQuery.of(context).size.height * 0.1,
//               width: MediaQuery.of(context).size.height * 0.1,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(40.0),
//                   color: Colors.blue[800],
//                   image: const DecorationImage(
//                       image: NetworkImage(
//                           'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'))),
//             ),
//           ]),
//           const SizedBox(height: 8.0),
//           FittedBox(
//             child: Text(
//               name,
//               style: const TextStyle(
//                 fontFamily: 'Quicksand',
//                 fontWeight: FontWeight.bold,
//                 fontSize: 15.0,
//               ),
//             ),
//           ),
//           const SizedBox(height: 5.0),
//           FittedBox(
//             child: Text(
//               address,
//               style: const TextStyle(
//                   fontFamily: 'Quicksand',
//                   fontWeight: FontWeight.bold,
//                   fontSize: 12.0,
//                   color: Colors.grey),
//             ),
//           ),
//           const SizedBox(height: 20.0),
//           Expanded(
//               child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                     color: Colors.blue[800],
//                     borderRadius: const BorderRadius.only(
//                         bottomLeft: Radius.circular(10.0),
//                         bottomRight: Radius.circular(10.0)),
//                   ),
//                   child: Center(
//                       child: TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                                 NGOProfile(widget.donorId, ngoId)),
//                       );
//                     },
//                     child: const Text(
//                       'View Profile',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontFamily: 'Quicksand',
//                       ),
//                     ),
//                   ))))
//         ],
//       ),
//       margin: cardIndex.isEven
//           ? const EdgeInsets.fromLTRB(10.0, 0.0, 25.0, 10.0)
//           : const EdgeInsets.fromLTRB(25.0, 0.0, 5.0, 10.0),
//     );
//   }
// }