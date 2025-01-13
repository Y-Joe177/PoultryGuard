import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:firebase_database/firebase_database.dart';

class SensorDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> sensor;

  const SensorDetailsScreen({super.key, required this.sensor});

  @override
  _SensorDetailsScreenState createState() => _SensorDetailsScreenState();
}

class _SensorDetailsScreenState extends State<SensorDetailsScreen> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  List<double> recentReadings = [];
  double exceedReading = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchRecentReadings();
  }

  void _fetchRecentReadings() {
    final DatabaseReference ref =
        database.ref('UsersData/NQnHFGEqAdcIfgfwye0XcWJXjBK2/readings');
        
    ref.limitToLast(7).onValue.listen((DatabaseEvent event) {
      final DataSnapshot snapshot = event.snapshot;
      if (snapshot.exists) {
        print("Data updated");
        final Map<String, dynamic> readingsMap =
            Map<String, dynamic>.from(snapshot.value as Map);
        final List<double> readingsList = readingsMap.values
            .map((value) =>
                double.tryParse(value[widget.sensor['firebase']]) ?? 0.0)
            .toList();
        setState(() {
          recentReadings = readingsList;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    }).onError((error) {
      setState(() {
        isLoading = false;
      });
      print("Error listening to data: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    final double avgReading = recentReadings.isNotEmpty
        ? recentReadings.reduce((a, b) => a + b) / recentReadings.length
        : 0.0;
    final double maxReading = recentReadings.isNotEmpty
        ? recentReadings.reduce((a, b) => a > b ? a : b)
        : 0.0;
    final double minReading = recentReadings.isNotEmpty
        ? recentReadings.reduce((a, b) => a < b ? a : b)
        : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.sensor['title']),
        backgroundColor: widget.sensor['color'],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                // Card for Summary Data

                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Icon(widget.sensor['icon'],
                              size: 40, color: widget.sensor['color']),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const Text('Average',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text(avgReading.toStringAsFixed(1),
                                    style: const TextStyle(fontSize: 24)),
                              ],
                            ),
                            Column(
                              children: [
                                const Text('Max',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text(maxReading.toStringAsFixed(1),
                                    style: const TextStyle(fontSize: 24)),
                              ],
                            ),
                            Column(
                              children: [
                                const Text('Min',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text(minReading.toStringAsFixed(1),
                                    style: const TextStyle(fontSize: 24)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Bar Chart for Recent Readings
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text('Recent Readings',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 200,
                          child: BarChart(
                            BarChartData(
                              barGroups: recentReadings
                                  .asMap()
                                  .entries
                                  .map((entry) => BarChartGroupData(
                                        x: entry.key,
                                        barRods: [
                                          BarChartRodData(
                                            toY: entry.value,
                                            color: widget.sensor['color'],
                                            width: 15,
                                          ),
                                        ],
                                      ))
                                  .toList(),
                              borderData: FlBorderData(show: false),
                              gridData: const FlGridData(show: false),
                              titlesData: const FlTitlesData(
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: true),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
    );
  }
}
