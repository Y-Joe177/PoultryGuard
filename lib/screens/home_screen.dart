import 'package:flutter/material.dart';
import 'package:poultry_guard/screens/sensor_detail_screen.dart';
import 'package:poultry_guard/widgets/card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> sensors = [
    {'title': 'Light Intensity', 'color': Colors.yellow, 'icon': Icons.wb_sunny, 'details': 'Details about Light Intensity'},
    {'title': 'VOC', 'color': Colors.green, 'icon': Icons.science, 'details': 'Details about VOC'},
    {'title': 'Temperature', 'color': Colors.orange, 'icon': Icons.thermostat, 'details': 'Details about Temperature'},
    {'title': 'Temperature Exceeds X', 'color': Colors.red, 'icon': Icons.warning, 'details': 'Details about Temp > X'},
    {'title': 'Temperature Exceeds Y', 'color': Colors.blue, 'icon': Icons.ac_unit, 'details': 'Details about Temp < Y'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Monitor Sensors"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 16,
          childAspectRatio: 3/2
        ),
        padding: EdgeInsets.all(16),
        itemCount: sensors.length,
        itemBuilder: (ctx, i) => OrangeCard(
          title: sensors[i]['title'],
          icon: sensors[i]['icon'],
          baseColor: sensors[i]['color'],
          textColor: sensors[i]['color'] == Colors.yellow? Colors.black : Colors.white,
          onClick: () {
            Navigator.push(context, MaterialPageRoute(builder: (ctx) => SensorDetailsScreen(sensor: sensors[i])));
          },
          ),
        // children: [
        //   OrangeCard(
        //     title: 'Light Intensity',
        //     icon: Icons.wb_sunny,
        //     baseColor: Colors.yellow,
        //     textColor: Colors.black,
        //   ),
        //   OrangeCard(
        //     title: 'VOC',
        //     icon: Icons.science,
        //     baseColor: Colors.green,
        //   ),
        //   OrangeCard(
        //     title: 'Temperature',
        //     icon: Icons.thermostat,
        //   ),
        //   OrangeCard(
        //     title: 'Temperature Exceeds X',
        //     icon: Icons.warning,
        //     baseColor: Colors.red,
        //   ),
        //   OrangeCard(
        //     title: 'Temperature Exceeds Y',
        //     icon: Icons.ac_unit,
        //     baseColor: Colors.blue,
        //   ),
        // ],
      ),
    );
  }
}