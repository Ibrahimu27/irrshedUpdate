import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class BarChartExample extends StatefulWidget {
  @override
  _BarChartExampleState createState() => _BarChartExampleState();
}

class _BarChartExampleState extends State<BarChartExample> {
  List<BarChartGroupData> barGroups = [];

  @override
  void initState() {
    super.initState();
    updateData(90); // Initial value
  }

  void updateData(double initialValue) {
    final data = <double>[];
    final today = DateTime.now();
    data.add(initialValue); // Today

    // Yesterday
    final yesterday = today.subtract(Duration(days: 1));
    data.add(initialValue - 20);

    // A day before yesterday
    final dayBeforeYesterday = today.subtract(Duration(days: 2));
    data.add(initialValue - 40);

    for (var i = 0; i < data.length; i++) {
      barGroups.add(BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            y: data[i],
            colors: [Colors.green],
            width: 60, // Width of each bar
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 78.0),
        child: AspectRatio(
          aspectRatio: 1.5,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 120.0, // Set the maximum Y-axis value
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: SideTitles(showTitles: false),
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTitles: (double value) {
                      // Display today, yesterday, and a day before yesterday
                      if (value == 0) {
                        return DateFormat('MM/dd').format(DateTime.now());
                      } else if (value == 1) {
                        return DateFormat('MM/dd').format(DateTime.now().subtract(Duration(days: 1)));
                      } else if (value == 2) {
                        return DateFormat('MM/dd').format(DateTime.now().subtract(Duration(days: 2)));
                      }
                      return '';
                    },
                  ),
                ),
                gridData: FlGridData(
                  show: false,
                ),
                barGroups: barGroups,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
