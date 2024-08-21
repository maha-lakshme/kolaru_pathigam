import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:kolaru_pathigam/screens/home_page.dart';
import 'package:page_transition/page_transition.dart';


class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(

      //  seconds: 3,  // Duration of splash screen
      //   navigateAfterSeconds: HomeScreen(),  // Navigate to this screen after splash
      //   title: Text('My App', style: TextStyle(fontSize: 24)),
      //   image: Image.asset('assets/splash.png'),  // Your splash image
      //   backgroundColor: Colors.white,  // Background color
      //   loaderColor: Colors.blue,  
        
        splash: 'lib/images/splash_screen.png',
        splashTransition: SplashTransition.fadeTransition,
        splashIconSize: 500,
        backgroundColor: Color.fromARGB(255, 214, 243, 250), // Background color of the splash screen
        duration: 2000,
        nextScreen: const HomePage(),
        pageTransitionType: PageTransitionType.fade
        );
  }
}
