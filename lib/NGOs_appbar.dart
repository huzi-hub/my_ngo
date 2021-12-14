// // ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, unnecessary_string_interpolations, sized_box_for_whitespace, camel_case_types

// import 'package:flutter/material.dart';
// import 'package:my_ngo/Home2.dart';

// import 'donationHistory.dart';

// import 'contacts.dart';
// import 'my_drawer_header.dart';
// import 'notification.dart';
// import 'myprofile.dart';
// import 'notes.dart';
// import 'Home1.dart';
// import 'EditProfile.dart';

// void main() {
//   runApp(NGoApp1());
// }

// class NGoApp1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }

// final List<DonationData> donations = [
//   DonationData('Food', 2.0, 'Mon'),
//   DonationData('Books', 5.0, 'Tue'),
//   DonationData('food', 10.0, 'Thr'),
//   DonationData('Clothes', 20.0, 'Fri'),
//   DonationData('Food', 29.0, 'Sat'),
//   DonationData('Food', 15.0, 'Sun'),
// ];

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   var currentPage = DrawerSections.ngoprofile;

//   @override
//   Widget build(BuildContext context) {
//     var container;
//     if (currentPage == DrawerSections.ngoprofile) {
//       container = Home_2();
//     } else if (currentPage == DrawerSections.ngoprofile) {
//       container = EditProfile();
//     } else if (currentPage == DrawerSections.donations) {
//       container = DonartionHistory(donations);
//     } else if (currentPage == DrawerSections.notifications) {
//       container = NotificationsPage();
//     }
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue[800],
//         elevation: 0.1,
//         title: Padding(
//           padding: const EdgeInsets.fromLTRB(65, 0, 0, 0),
//           child: Text("E-Donation"),
//         ),
//       ),
//       body: container,
//       drawer: Drawer(
//         child: SingleChildScrollView(
//           child: Container(
//             child: Column(
//               children: [
//                 MyHeaderDrawer(),
//                 MyDrawerList(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget MyDrawerList() {
//     return Container(
//       padding: EdgeInsets.only(
//         top: 15,
//       ),
//       child: Column(
//         // shows the list of menu drawer
//         children: [
//           menuItem(1, "My Profile", Icons.image,
//               currentPage == DrawerSections.myprofile ? true : false),
//           menuItem(2, "Donations", Icons.dashboard,
//               currentPage == DrawerSections.donations ? true : false),
//           Divider(),
//           menuItem(3, "Settings", Icons.settings_outlined,
//               currentPage == DrawerSections.settings ? true : false),
//           menuItem(4, "Notifications", Icons.notifications_outlined,
//               currentPage == DrawerSections.notifications ? true : false),
//         ],
//       ),
//     );
//   }

//   Widget menuItem(int id, String title, IconData icon, bool selected) {
//     return Material(
//       color: selected ? Colors.grey[300] : Colors.transparent,
//       child: InkWell(
//         onTap: () {
//           Navigator.pop(context);
//           setState(() {
//             if (id == 1) {
//               currentPage = DrawerSections.ngoprofile;
//             } else if (id == 2) {
//               currentPage = DrawerSections.donations;
//             } else if (id == 3) {
//               currentPage = DrawerSections.settings;
//             } else if (id == 4) {
//               currentPage = DrawerSections.notifications;
//             }
//           });
//         },
//         child: Padding(
//           padding: EdgeInsets.all(15.0),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Icon(
//                   icon,
//                   size: 20,
//                   color: Colors.black,
//                 ),
//               ),
//               Expanded(
//                 flex: 3,
//                 child: Text(
//                   title,
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// enum DrawerSections {
//   ngoprofile,
//   donations,
//   settings,
//   notifications,
//   notes,
//   Home1,
//   myprofile,
// }
