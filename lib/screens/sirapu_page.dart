// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kolaru_pathigam/widgets/custom_app_bar.dart';
import 'package:kolaru_pathigam/widgets/custom_sliverappbar.dart';
import 'package:kolaru_pathigam/widgets/system_ui.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SirapuPage extends StatefulWidget {
  SirapuPage({super.key});

  @override
  State<SirapuPage> createState() => _SirapuPageState();
}

class _SirapuPageState extends State<SirapuPage> {
  late YoutubePlayerController _controller;
  Color _appBarColor = Colors.white;
  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light);
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: "l_dVTBXIZeM",
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    //AppBar scrollController
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _appBarColor = _scrollController.offset > 300
              ? const Color.fromARGB(255, 3, 19, 48)
              : Colors.white;
        });
        if (_scrollController.offset > 320) {
          //systemUiOverlayStyle = SystemUiOverlayStyle.dark;
           systemUiOverlayStyle = SystemUi().getUiStyles(Colors.transparent, Brightness.dark, Colors.white);
        } else {
          //systemUiOverlayStyle = SystemUiOverlayStyle.light;
          systemUiOverlayStyle = SystemUi().getUiStyles(Colors.transparent, Brightness.light, Colors.white);

        }
      });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(controller: _scrollController, slivers: [
      CustomSliverAppBar(
        title: "பலன்கள்",
        appBarColor: _appBarColor,
        imageAssetPath: 'lib/images/temple2.jpeg',
        systemStyle: systemUiOverlayStyle,
      ),
      SliverToBoxAdapter(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),
            child: Text(
              textAlign: TextAlign.left,
              "கோளறு பதிகத்தில் எல்லாப் பாடல்களிலும் முதல் இரண்டு அடிகளில் இறைவனின் திருவுருவத்தை வர்ணிக்கிறார் சம்பந்தர். அப்படிப்பட்ட திருவுருவை என் உள்ளத்திலே நான் வாங்கிக் கொண்டதால் என்னைக் கோள்கள் அணுகினாலும் நல்லதையே செய்யும் என்கிறார். அதனால் கோளறு பதிகத்தை வெறுமனே படிப்பதைக் காட்டிலும் இறைவனின் திருவுருவை மனதில் வாங்கிக்கொண்டு பாராயணம் செய்தால் பலன் நிச்சயம். \n\nதிருஞானசம்பந்தரின் அமுத வாக்குப்படி, கோளறு பதிகம் என்னும் இந்த அருள்தரும் உயர்பதிகத்தை அனுதினமும் ஓதும் பக்தர்களுக்கு நாள்கள், கோள்கள், தீயவர், இடி, மின்னல், பூதம், கடல், எமன், எமதூதர்கள், சிங்கம், புலி, யானை, பன்றி, பாம்பு, கரடி, அக்கினி, வினை, திருமால், பிரமன், தேவர்கள், சிறு தெய்வங்கள், மறை, காலம், மலை, வெப்பு, குளிர், வாதம், பித்தம் இவையெல்லாம் நல்லதையே செய்யும்.",
              style: GoogleFonts.muktaMalar(fontSize: 16),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),
            child: YoutubePlayer(
              controller: _controller,
              bottomActions: [
                const SizedBox(width: 14.0),
                CurrentPosition(),
                const SizedBox(width: 8.0),
                ProgressBar(  isExpanded: true,),
                RemainingDuration(),
                const PlaybackSpeedButton(),
              
                // Add other custom controls here
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "திருச்சிற்றம்பலம்",
            textAlign: TextAlign.center,
            style: GoogleFonts.muktaMalar(fontSize: 20),
          ),
        ],
      ))
    ]);
  }
}
