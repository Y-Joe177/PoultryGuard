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
        apiKey: "AIzaSyC4VCsfJC8SJdcHFj6-v3ObClPsd3ZMG7U",
        authDomain: "cap2-81e64.firebaseapp.com",
        databaseURL: "https://cap2-81e64-default-rtdb.europe-west1.firebasedatabase.app",
        projectId: "cap2-81e64",
        storageBucket: "cap2-81e64.appspot.com", // Fixed incorrect storage bucket URL
        messagingSenderId: "31930812812",
        appId: "1:31930812812:web:0c0a343b9f9a7716bf2ea9",
        measurementId: "G-D5EJV0Z5JM",
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
      title: 'PoultryGuard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      initialRoute: '/', // Added initial route for clarity
      routes: {
        '/': (ctx) => const HomeScreen(),
      },
    );
  }
}
