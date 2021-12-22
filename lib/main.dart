import 'package:flutter/material.dart';
import 'package:my_ngo/AcceptDonation.dart';
import 'package:my_ngo/EditProfile.dart';
import 'package:my_ngo/Login.dart';
import 'package:my_ngo/PRACMAP.dart';
import 'package:my_ngo/VolunteerAppbar.dart';
import 'package:my_ngo/VolunteerDashboard.dart';
import 'package:my_ngo/donorLocation.dart';
import 'package:my_ngo/nearbyNGOs1.dart';
import 'package:my_ngo/ngo_reg.dart';
import './ngoRecords.dart';
import './chatScreen.dart';
import './confirmDonation.dart';
import './donationRequest.dart';
import './signup.dart';
import 'volunteer_registration.dart';
import './alertPopup.dart';
import './assignVolunteer.dart';
import './donationType.dart';
import './nearbyNGOs.dart';
import './ngoProfile.dart';
import './donationHistory.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

// final List<DonationData> donations = [
//   DonationData('Food', 2.0, 'Mon'),
//   DonationData('Books', 5.0, 'Tue'),
//   DonationData('food', 10.0, 'Thr'),
//   DonationData('Clothes', 20.0, 'Fri'),
//   DonationData('Food', 29.0, 'Sat'),
//   DonationData('Food', 15.0, 'Sun'),
// ];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Donation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'E-Donation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapScreen(),
    );
  }
}
