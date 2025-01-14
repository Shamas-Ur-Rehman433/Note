import 'package:flutter/material.dart';
import 'package:note/ListMapProvider.dart';
import 'package:note/Note.dart';
import 'package:note/SplashScreen.dart';// Import the SplashScreen
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ListMapProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(), // Set the SplashScreen as the home
      ),
    );
  }
}
