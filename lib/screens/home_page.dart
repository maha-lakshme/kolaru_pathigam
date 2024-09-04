// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kolaru_pathigam/screens/padal_page.dart';
import 'package:kolaru_pathigam/screens/sirapu_page.dart';
import 'package:kolaru_pathigam/screens/varalaru_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  final List<Widget> screens = [PadalPage(), VaralaruPage(), SirapuPage()];
  int? selectedIndex;
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 2.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        //Bottom Navigation
        bottomNavigationBar: 
        SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
           // margin: EdgeInsets.only(left: 10,right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 8),
              child: GNav(
                tabActiveBorder: Border.all(color: Colors.black),
                gap: 10,
                color: Colors.grey[600],
                activeColor: Colors.black,
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                iconSize: 20,
                textStyle: TextStyle(fontSize: 16, color: Colors.black),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14.5),
                duration: Duration(milliseconds: 800),
                tabs: [
                  GButton(
                      leading: SizedBox(
                          width: 20,
                          height: 20,
                          child: Image.asset(
                            "lib/images/shiva5.png",
                          )),
                      icon: Icons.home,
                      text: " பாடல்",
                      textStyle: GoogleFonts.mukta(fontSize: 15)),
                  GButton(
                    leading: SizedBox(
                        width: 25,
                        height: 25,
                        child: Image.asset(
                          "lib/images/thirsul2.png",
                        )),
                    icon: Icons.ac_unit_sharp,
                    text: "வரலாறு",
                    textStyle: GoogleFonts.muktaMalar(fontSize: 15),
                  ),
                  GButton(
                      leading: SizedBox(
                          width: 30,
                          height: 30,
                          child: Image.asset(
                            "lib/images/nandi.png",
                          )),
                      icon: Icons.abc,
                      text: 'சிறப்பு',
                      textStyle: GoogleFonts.muktaMalar(fontSize: 15)),
                ],
                selectedIndex: _page,
                onTabChange: (index) {
                  setState(() {
                    _page = index;
                  });
                },
              ),
            ),
          ),
        ),
        body: screens[_page]);
  }
}
