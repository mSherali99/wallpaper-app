import 'package:flutter/material.dart';
import 'package:wallpaper/di/di.dart';
import 'package:wallpaper/presetation/screens/main/main_screen.dart';

void main() {
  runApp(const MyApp());
  diSetup();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}

