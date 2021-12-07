import 'package:flutter/material.dart';
import './donationHistory.dart';
import './headingWidget.dart';
import './main.dart';

String _selectedVolunteers = '';

// ignore: must_be_immutable
class AssignVolunteer extends StatefulWidget {
  List<DonationData> donations;
  AssignVolunteer(this.donations);

  @override
  _AssignVolunteerState createState() => _AssignVolunteerState();
}

class _AssignVolunteerState extends State<AssignVolunteer> {
  String? value;
  final items = ['furqan', 'saad', 'Huzaifa', 'Shahmeer'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            HeadingWidget('Assign Volunteer'),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    height: 400,
                    child: ListView.builder(
                        itemCount: donations.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 5),
                            elevation: 1.0,
                            child: ListTile(
                              leading: Text('${(index + 1).toString()}',
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 20,
                                  )),
                              title: Text(
                                donations[index].donationName,
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 20,
                                ),
                              ),
                              subtitle: Text('${donations[index].day}'),
                              trailing: Container(
                                child: DropdownButton<String>(
                                  hint: Text(
                                    'Select Volunteer',
                                    style: TextStyle(fontFamily: 'Quicksand'),
                                  ),
                                  value: value,
                                  items: items.map(buildMenuItem).toList(),
                                  onChanged: (value) =>
                                      setState(() => this.value = value),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Quicksand'),
      ),
    );
