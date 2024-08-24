import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Varalaru_page extends StatefulWidget {
  const Varalaru_page({super.key});

  @override
  State<Varalaru_page> createState() => _Varalaru_pageState();
}

class _Varalaru_pageState extends State<Varalaru_page> {
  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light);
  int _current = 0;
  List<String> images = [
    'lib/images/pandiya_king.jpg',
    'lib/images/thiruganasambandar_arrival.jpeg',
    'lib/images/writing_manuscript.jpeg',
    'lib/images/shiva_blessing.jpeg'
  ];
  List<String> lines = [
    "மதுரை பாண்டிய மன்னன் நின்ற சீர்நெடுமாறன் சமண மதத்தில் பற்று கொண்டு, மற்ற சமயங்களைப் புறக்கணித்து வந்தார். அவரது மனைவி மங்கையர்க்கரசியார் சைவ சமயத்தில் பற்று கொண்டிருந்தார். சமணர்களின் அடாத செயல்களால் நாட்டில் குழப்பங்கள் நிலவ, அதைத் தடுக்கும் பொருட்டு திருஞான சம்பந்தர் மதுரைக்கு அழைப்பு விடுத்தார் .",
    "திருஞானசம்பந்தரும், திருநாவுக்கரச பெருமானும் அப்போது திருமறைக்காட்டில் இருந்தனர். மதுரையம்பதி அரசியாரின் வேண்டுகோளை ஏற்று, திருஞான சம்பந்தர் மதுரை செல்ல விரும்பினார். ஆனால், திருநாவுக்கரசர் அச்சமயம் நிலவிய கோள்களின் அமைப்பும் தீமை பயக்கும் என்று கூறி, சம்பந்தரின் பயணத்தை ஒத்திப்போடச் சொன்னார் ",
    "‘சகலத்துக்கும் தலைவனான நம் ஈசன் துணை இருக்கையில், நாளும் கோளும் என்ன செய்துவிட முடியும். ஈசனின் அடியாருக்கு அவை நன்மையே செய்யும். கவலை வேண்டாம்’ என்று கூறி, திருஞான சம்பந்தர் கோளறு பதிகத்தை பாடினார். இந்த பதிகம் நவகிரக தோஷங்களை நீக்கி, நன்மைகளை வழங்கும் . ",
    "கோளறு பதிகத்தை பாடிய பிறகு, திருஞான சம்பந்தர் மதுரைக்கு பயணம் செய்து, சமணர்களின் அடாத செயல்களை முறியடித்து, சைவ சமயத்தை மீண்டும் நிலைநாட்டினார்.\n\nதிருச்சிற்றம்பலம்"
  ];
  List<Widget> generateImagesTiles() {
    return images
        .map((element) => ClipRRect(
              child: Image.asset(
                element,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ))
        .toList();
  }

  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        //  padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            AppBar(
                centerTitle: true,
                titleTextStyle: TextStyle(color: Colors.black),
                title: Text(
                  "கோளறு திருப்பதிகம்",
                  style: GoogleFonts.muktaMalar(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                ),
                elevation: 3,
                // backgroundColor:HexColor("#6497b1"),
                // backgroundColor:Colors.grey[200],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)))),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: CarouselSlider(
                    items: generateImagesTiles(),
                    carouselController: buttonCarouselController,
                    options: CarouselOptions(
                      height: 380,
                      aspectRatio: 16 / 7,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.6,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () => buttonCarouselController.previousPage(),
                      child: Icon(Icons.arrow_back_ios_new_rounded),
                      // style: ElevatedButton.styleFrom(
                      //   shape: CircleBorder(),
                      //   padding: EdgeInsets.all(10),
                      // ),
                    ),
                    MaterialButton(
                      onPressed: () => buttonCarouselController.nextPage(),
                      child: Icon(Icons.arrow_forward_ios_rounded),
                      // style: ElevatedButton.styleFrom(
                      //   shape: CircleBorder(),
                      //   padding: EdgeInsets.all(10),
                      // ),
                    )
                  ],
                ),
              ],
            ),
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(8, 1, 8, 8),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(lines[_current],
                    textAlign: TextAlign.left,
                    style: GoogleFonts.muktaMalar(fontSize: 16)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
