// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late ScrollController _scrollController;

  List slideImgList = [
    'lib/images/shiva_slide5.jpeg',
    'lib/images/shiva_slide2.jpg',
    'lib/images/shiva_slide3.jpg'
  ];
 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController = ScrollController()..addListener(() {
      setState(() {
       // _textColor = _isSliverAppBarExpanded ? Colors.white : Colors.blue;
      });
    });
    
  }
  bool get _isSliverAppBarExpanded {
    print("scroll");
  return _scrollController.hasClients &&
      _scrollController.offset > (320- kToolbarHeight);
}

  @override
  Widget build(BuildContext context) {
    
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          title: _isSliverAppBarExpanded ? const Text('Kolaru Pathigam') : null,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.blue,
              statusBarIconBrightness: Brightness.light),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          expandedHeight: 320,
          bottom: AppBar(
            backgroundColor: Colors.transparent,
            // title: Center(
            //   child: Text(
            //     maxLines: 2,
            //     overflow: TextOverflow.ellipsis,
            //     'கோளும் நாளும் அடியாரை வந்து நலியாத வண்ணம் உரை செய்த சொல் மாலை ',
            //     style: GoogleFonts.inter(
            //         textStyle: TextStyle(
            //             color: Colors.white,
            //             fontFamily: GoogleFonts.muktaMalar.toString(),
            //             fontSize: 20,
            //             fontWeight: FontWeight.w600)),
            //   ),
            // ),
            centerTitle: true,
          //     flexibleSpace: ClipRRect(
          //        borderRadius: BorderRadius.only(
          //       bottomLeft: Radius.circular(20),
          //       bottomRight: Radius.circular(20)
          //     ),
          // child: BackdropFilter(
          //   filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          //   child: Container(
          //    // color: Colors.grey.shade200.withOpacity(0.5),
          //     alignment: Alignment.center,
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Text(
          //         maxLines: 2,
          //         overflow: TextOverflow.ellipsis,
          //         'கோளும் நாளும் அடியாரை வந்து நலியாத வண்ணம் உரை செய்த சொல் மாலை ',
          //         style: GoogleFonts.inter(
          //             textStyle: TextStyle(
          //                 color: Colors.white,
          //                 fontFamily: GoogleFonts.muktaMalar.toString(),
          //                 fontSize: 20,
          //                 fontWeight: FontWeight.w600)),
          //       ),
          //     ),
          //   ),
          // ),
        ),
       //   ),
          flexibleSpace:_isSliverAppBarExpanded ?null : FlexibleSpaceBar(
            titlePadding: EdgeInsets.only(left: 0,right: 0),
            title: ClipRect(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3.0,sigmaY: 3.0),
                  child: Text(
                          'கோளும் நாளும் அடியாரை வந்து நலியாத வண்ணம் உரை செய்த சொல் மாலை ',
                          style:
                             TextStyle(
                          color: Colors.white,
                          fontFamily: GoogleFonts.muktaMalar.toString(),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                          textAlign: TextAlign.left,
                        ),
                ),
              ),
            ),
            background: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
              ),
              child: Image.asset(
                'lib/images/shiva13.jpeg',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
            floating: false,
            snap: false,
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
             
              // Container(
              //   height: 250,
              //   margin: EdgeInsets.all(8),
              //   child: Swiper(
              //     itemBuilder: (context, index) {
              //       return Image.asset(
              //         slideImgList[index],
              //         fit: BoxFit.fill,
              //       );
              //     },
              //     itemCount: slideImgList.length,
              //     viewportFraction: 0.8,
              //     scale: 0.9,
              //     //  pagination: SwiperPagination(),
              //     //control: SwiperControl(),
              //   ),
              // ),
              Card(
                margin: EdgeInsets.all(8),
                elevation: 25,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                          "மதுரை பாண்டிய மன்னன் நின்ற சீர்நெடுமாறன் சமண மதத்தில் பற்று கொண்டு, மற்ற சமயங்களைப் புறக்கணித்து வந்தார். அவர் மனைவி மங்கையர்க்கரசியார் சைவ சமயத்தில் பற்று கொண்டிருந்தார். சமணர்களின் அடாத செயல்களால் நாட்டில் குழப்பங்கள் நிலவ, அதைத் தடுக்கும் பொருட்டு திருஞான சம்பந்தர் மதுரைக்கு எழுந்தருளி சைவம் தழைக்கவும் நாட்டில் நல்லாட்சி நிலவவும் அழைப்பு விடுத்தார். திருஞான சம்பந்தரும், திருநாவுக்கரச பெருமானும் அப்போது திருமறைக்காட்டில் இருந்தனர். மதுரையம்பதி அரசியாரின் வேண்டுகோளை ஏற்று திருஞான சம்பந்தர் மதுரை செல்ல விரும்பி திருநாவுக்கரசரிடம் விடைபெறச் சென்றார். திருநாவுக்கரசரோ, அச்சமயம் நிலவிய கோள்களின் அமைப்பும் போக்கும் தீமை பயக்கும் என்று கூறி சம்பந்தரின் பயணத்தை ஒத்திப்போடச் சொன்னார்.",
                          style: GoogleFonts.pavanam(
                            fontSize: 15,
                          )),
                      Text(
                        "\n'சகலத்துக்கும் தலைவனான நம் ஈசன் துணை இருக்கையில், நாளும் கோளும் என்ன செய்துவிட முடியும். ஈசனின் அடியாருக்கு அவை நன்மையே செய்யும். கவலை வேண்டாம்’ என்று கூறி கோளறு பதிகம் பாடினார். பதிகப்பயனுடன் சேர்த்து மொத்தம் பதினொரு பாடல்கள் கொண்ட இந்த கோள்களின் தீவினையை நீக்கும் இந்தப் பாடல்கள் சிறந்த பரிகாரப் பாடல்களாக விளங்குகின்றன.'",
                        style: GoogleFonts.pavanam(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        //       Container(
        //         height: 250,
        //         margin: EdgeInsets.all(8),
        //         child: Swiper(
        // itemBuilder: (context, index) {
        //   return Image.asset(
        //  slideImgList[index],
        //     fit: BoxFit.fill,
        //   );
        // },
        // itemCount: slideImgList.length,
        // viewportFraction: 0.8,
        // scale: 0.9,

        //  pagination: SwiperPagination(),
        //   control: SwiperControl(),
        //         ),
        //       ),

        //       Card(
        //         margin: EdgeInsets.all(8),
        //         elevation: 25,
        //         child: Padding(
        // padding: const EdgeInsets.all(8.0),
        // child: Column(
        //   children: [
        //     Text(
        //         "மதுரை பாண்டிய மன்னன் நின்ற சீர்நெடுமாறன் சமண மதத்தில் பற்று கொண்டு, மற்ற சமயங்களைப் புறக்கணித்து வந்தார். அவர் மனைவி மங்கையர்க்கரசியார் சைவ சமயத்தில் பற்று கொண்டிருந்தார். சமணர்களின் அடாத செயல்களால் நாட்டில் குழப்பங்கள் நிலவ, அதைத் தடுக்கும் பொருட்டு திருஞான சம்பந்தர் மதுரைக்கு எழுந்தருளி சைவம் தழைக்கவும் நாட்டில் நல்லாட்சி நிலவவும் அழைப்பு விடுத்தார். திருஞான சம்பந்தரும், திருநாவுக்கரச பெருமானும் அப்போது திருமறைக்காட்டில் இருந்தனர். மதுரையம்பதி அரசியாரின் வேண்டுகோளை ஏற்று திருஞான சம்பந்தர் மதுரை செல்ல விரும்பி திருநாவுக்கரசரிடம் விடைபெறச் சென்றார். திருநாவுக்கரசரோ, அச்சமயம் நிலவிய கோள்களின் அமைப்பும் போக்கும் தீமை பயக்கும் என்று கூறி சம்பந்தரின் பயணத்தை ஒத்திப்போடச் சொன்னார்.",
        //         style: GoogleFonts.pavanam(
        //           fontSize: 15,
        //         )),
        //     Text(
        //       "\n'சகலத்துக்கும் தலைவனான நம் ஈசன் துணை இருக்கையில், நாளும் கோளும் என்ன செய்துவிட முடியும். ஈசனின் அடியாருக்கு அவை நன்மையே செய்யும். கவலை வேண்டாம்’ என்று கூறி கோளறு பதிகம் பாடினார். பதிகப்பயனுடன் சேர்த்து மொத்தம் பதினொரு பாடல்கள் கொண்ட இந்த கோள்களின் தீவினையை நீக்கும் இந்தப் பாடல்கள் சிறந்த பரிகாரப் பாடல்களாக விளங்குகின்றன.'",
        //       style: GoogleFonts.pavanam(
        //         fontSize: 16,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     )
        //   ],
        // ),
        //         ),
        //       ),
      ],
    );
  }
}
