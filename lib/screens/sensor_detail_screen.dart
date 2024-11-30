import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SensorDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> sensor;

  SensorDetailsScreen({required this.sensor});

  @override
  Widget build(BuildContext context) {
    // Simulated data
    final List<double> recentReadings = [10, 20, 15, 25, 18, 22, 30];
    final double avgReading = recentReadings.reduce((a, b) => a + b) / recentReadings.length;
    final double maxReading = recentReadings.reduce((a, b) => a > b ? a : b);
    final double minReading = recentReadings.reduce((a, b) => a < b ? a : b);

    return Scaffold(
      appBar: AppBar(
        title: Text(sensor['title']),
        backgroundColor: sensor['color'],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Card for Summary Data
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Icon(sensor['icon'], size: 40, color: sensor['color']),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text('Average', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            Text(avgReading.toStringAsFixed(1), style: const TextStyle(fontSize: 24)),
                          ],
                        ),
                        Column(
                          children: [
                            const Text('Max', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            Text(maxReading.toStringAsFixed(1), style: const TextStyle(fontSize: 24)),
                          ],
                        ),
                        Column(
                          children: [
                            const Text('Min', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            Text(minReading.toStringAsFixed(1), style: const TextStyle(fontSize: 24)),
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
                    const Text('Recent Readings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                                        color: sensor['color'],
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
            const SizedBox(height: 16),

            // Additional Card for Static Info
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(
                      sensor['details'],
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}