import 'package:flutter/material.dart';
import 'package:poultry_guard/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(KIsWeb){ 
  await firebase.initializeApp (
    options: firebase0options(  
      apiKey: "AIzaSyChHH3RopmaruhQlbHwMVVI-mStgzVKxDQ",
      authDomain: "capstone-524b6.firebaseapp.com",
      databaseURL: "https://capstone-524b6-default-rtdb.europe-west1.firebasedatabase.app",
      projectId: "capstone-524b6",
      storageBucket: "capstone-524b6.firebasestorage.app",
      messagingSenderId: "113151719878",
      appId: "1:113151719878:web:8ed36f6a8b595a2b6b9ac7",
      measurementId: "G-PDETR4EP19"));  
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
