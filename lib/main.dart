import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Added Firebase Core import
import 'package:poultry_guard/screens/home_screen.dart'; // Ensure this file exists and is correctly referenced

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeFirebase(); // Moved Firebase initialization to a separate function for clarity
  runApp(const MyApp());
}

Future<void> _initializeFirebase() async {
  if (kIsWeb) { // Fixed capitalization of `kIsWeb`
    await Firebase.initializeApp(
      options: const FirebaseOptions( // Correct class name and usage
          apiKey: "AIzaSyDeLeDfku49bCIeLIW1lap5h4sTFgYwG6I",
          authDomain: "cap4-3aa91.firebaseapp.com",
          databaseURL: "https://cap4-3aa91-default-rtdb.europe-west1.firebasedatabase.app",
          projectId: "cap4-3aa91",
          storageBucket: "cap4-3aa91.firebasestorage.app",
          messagingSenderId: "593122259416",
          appId: "1:593122259416:web:e8876516842053b0c042ad",
          measurementId: "G-J96ZV6P7R4"
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PoultryGuard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monitor Sensors'),
      ),
      body: Column(
        children: [
          // Add other widgets here (e.g., buttons, cards)
          const Spacer(), // Pushes the table to the bottom of the screen
          Table(
            border: TableBorder.all(),
            columnWidths: const {
              0: FlexColumnWidth(2), // Adjusts column width proportions
              1: FlexColumnWidth(1),
            },
            children: const [
              TableRow(children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Parameter',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Value',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Temperature'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('18 °C'),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Current VOCs'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('0 ppm'),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Current Light Intensity'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('4095'),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Predicted Temperature'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('4095 °C'),
                ),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
