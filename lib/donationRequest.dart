// ignore_for_file: file_names
// // ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, unnecessary_string_interpolations, sized_box_for_whitespace

// import 'package:flutter/material.dart';
// import './donationHistory.dart';
// import './main.dart';
// import './headingWidget.dart';

// class DonationRequest extends StatefulWidget {
//   //List<DonationData> donations = [];
//   //DonationRequest(this.donations);

//   @override
//   _DonationRequestState createState() => _DonationRequestState();
// }

// class _DonationRequestState extends State<DonationRequest> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(children: <Widget>[
//         HeadingWidget('Donation History'),
//         Container(
//           height: 400,
//           child: ListView.builder(
//               itemCount: donations.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
//                   elevation: 1.0,
//                   child: ListTile(
//                     leading: Text('${(index + 1).toString()}',
//                         style: TextStyle(
//                           fontFamily: 'Quicksand',
//                           fontSize: 20,
//                         )),
//                     title: Text(
//                       donations[index].donationName,
//                       style: TextStyle(
//                         fontFamily: 'Quicksand',
//                         fontSize: 20,
//                       ),
//                     ),
//                     subtitle: Text('${donations[index].day}'),
//                     trailing: Column(children: [
//                       Text('Amount'),
//                       Text('${donations[index].donationAmount}')
//                     ]),
//                   ),
//                 );
//               }),
//         ),
//       ]),
//     );
//   }
// }
