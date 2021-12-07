// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, unnecessary_string_interpolations, sized_box_for_whitespace

import 'package:flutter/material.dart';
import './headingWidget.dart';
import './main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// ignore: must_be_immutable
class DonartionHistory extends StatefulWidget {
  List<DonationData> donations = [];
  DonartionHistory(this.donations);

  @override
  _DonartionHistoryState createState() => _DonartionHistoryState();
}

class _DonartionHistoryState extends State<DonartionHistory> {
  late List<DonationData> _chartData;
  @override
  void initState() {
    _chartData = donations;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        HeadingWidget('Donation History'),
        Container(
          height: 200,
          child: Card(
              child: SfCartesianChart(
            series: <ChartSeries>[
              BarSeries<DonationData, String>(
                dataSource: _chartData,
                xValueMapper: (DonationData donations, _) => donations.day,
                yValueMapper: (DonationData donations, _) =>
                    donations.donationAmount,
              )
            ],
            primaryXAxis: CategoryAxis(),
          )),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 400,
          child: ListView.builder(
              itemCount: donations.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
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
                    trailing: Column(children: [
                      Text('Amount'),
                      Text('${donations[index].donationAmount}')
                    ]),
                  ),
                );
              }),
        ),
      ]),
    );
  }
}

class DonationData {
  final String donationName;
  final String day;
  final double donationAmount;
  DonationData(this.donationName, this.donationAmount, this.day);
}
