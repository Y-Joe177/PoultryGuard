import 'package:flutter/material.dart';
import 'package:poultry_guard/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(KIsWeb){ 
  await firebase.initializeApp (
    options: firebase0options(  
      apiKey: "AIzaSyC4VCsfJC8SJdcHFj6-v3ObClPsd3ZMG7U",
      authDomain: "cap2-81e64.firebaseapp.com",
      databaseURL: "https://cap2-81e64-default-rtdb.europe-west1.firebasedatabase.app",
      projectId: "cap2-81e64",
      storageBucket: "cap2-81e64.firebasestorage.app",
      messagingSenderId: "31930812812",
      appId: "1:31930812812:web:0c0a343b9f9a7716bf2ea9",
      measurementId: "G-D5EJV0Z5JM"
  }else{
    await firebase.initializeApp();
  }
  runApp(const MyApp());}
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PoultryGuard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      routes: {
        '/': (ctx) => const HomeScreen(),
      },
    );
  }
}
