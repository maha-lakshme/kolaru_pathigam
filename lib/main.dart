// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kolaru_pathigam/screens/home_page.dart';

void main() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,  
                statusBarColor: Colors.transparent,
                systemNavigationBarColor: Colors.white));
              
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 7, 69, 149)),
        cardTheme: CardTheme(
          color: Colors.white,
          surfaceTintColor: Colors.white, // Ensure correct color display
        ),
      ),
    );
  }
}
