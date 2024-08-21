// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kolaru_pathigam/screens/splash_screen.dart';
import 'package:kolaru_pathigam/widgets/system_ui.dart';

void main() {
  //   WidgetsFlutterBinding.ensureInitialized();

     SystemChrome.setSystemUIOverlayStyle(SystemUi().getUiStyles(Colors.transparent, Brightness.dark, Colors.white,)
      // SystemUiOverlayStyle(
      //   statusBarColor: Colors.transparent,
      //   statusBarIconBrightness: Brightness.dark,
      //   systemNavigationBarColor:  Colors.white,
      // ),
    );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
 

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),

      // theme: AppTheme().getTheme(context),
      // themeMode: ThemeMode.light,

      theme:ThemeData(
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 7, 69, 149)),
        cardTheme: CardTheme(
          color:Colors.white ,
          surfaceTintColor: Colors.white, // Ensure correct color display
        ),
      ),
     );
  }
}
