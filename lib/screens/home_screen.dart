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
    {'title': 'Light Intensity', 'firebase': 'Light_Intensity', 'color': Colors.yellow, 'icon': Icons.wb_sunny, 'details': 'Details about Light Intensity'},
    {'title': 'VOC', 'firebase': 'VOCs_(in_PPM)', 'color': Colors.green, 'icon': Icons.science, 'details': 'Details about VOC'},
    {'title': 'Temperature', 'firebase': 'Temperature_(in_degrees_C)', 'color': Colors.orange, 'icon': Icons.thermostat, 'details': 'Details about Temperature'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Monitor Sensors"),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 16,
          childAspectRatio: 3/2
        ),
        padding: const EdgeInsets.all(16),
        itemCount: sensors.length,
        itemBuilder: (ctx, i) => OrangeCard(
          firebase: sensors[i]['firebase'],
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