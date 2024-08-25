import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kolaru_pathigam/models/padal.dart';
import 'package:kolaru_pathigam/widgets/custom_app_bar.dart';
import 'package:kolaru_pathigam/widgets/custom_sliverappbar.dart';

class PadalPage extends StatefulWidget {
  const PadalPage({super.key});

  @override
  State<PadalPage> createState() => _PadalPageState();
}

class _PadalPageState extends State<PadalPage> with WidgetsBindingObserver {
  AudioPlayer audioPlayer = AudioPlayer();
  int? selectedIndex;
  late ScrollController _scrollController;
  Color _appBarColor = Colors.white;
  SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  );

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 2.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  List<PadalList> padalListItems = [
    PadalList(
        padalName:
            "வேயுறு தோளி பங்கன் விடமுண்ட கண்டன் மிக நல்ல வீணை தடவி \nமாசறு திங்கள் கங்கை முடி மேல் அணிந்து என் உளமே புகுந்த அதனால் \nஞாயிறு திங்கள் செவ்வாய் புதன் வியாழன் வெள்ளி சனி பாம்பிரண்டும் உடனே \nஆசறு நல்லநல்ல அவை நல்லநல்ல அடியாரவர்க்கு மிகவே!",
        padalAssetName: "padal1.mp3",
        padalVarigal:
            "- (எம்பெருமான்) மூங்கில் போன்ற தோளினை உடைய உமையவளுக்கு தன் உடம்பினில் பாகம் கொடுத்தவன். ஆலகால விடத்தை உயிர்களைக் காக்கும் பொருட்டு அருந்தி திருக்கழுத்தினில் தாங்கியவன். \n- இனிமையான இசையை எழுப்பும் வீணையை வாசித்துக்கொண்டு (இருக்கும் அவன்) களங்கமில்லாத பிறையையும் கங்கையையும் தன் திருமுடி மேல் அணிந்து கொண்டு, \n- என் உளம் முழுவதும் நிறைந்து காணப்படுவதால் (அதாவது நான் சிவசிந்தையில் இருப்பதால்) சூரியன், சந்திரன், செவ்வாய், புதன், குரு, சுக்கிரன், சனி, மற்றும் பாம்பாகிய ராகு- கேது என்னும் ஒன்பது கோள்களும் ஒரு குற்றமும் இல்லாதவையாக (என் போன்ற) சிவனடியாருக்கு என்றும் மிக மிக நல்லதையே செய்யும்!"),
    PadalList(
        padalName:
            "என்பொடு கொம்பொ(டு) ஆமை இவை மார்பிலங்க எருதேறி ஏழையுடனே \nபொன்பொதி மத்தமாலை புனல் சூடி வந்தென் உளமே புகுந்த அதனால் \nஒன்பதொடு ஒன்றொடு ஏழு பதினெட்டொடாறும் உடனாய நாள்களவை தாம் \nஅன்பொடு நல்லநல்ல அவை நல்லநல்ல அடியாரவர்க்கு மிகவே!",
        padalAssetName: "padal2.mp3",
        padalVarigal:
            "திருமாலின் வாமன, பன்றி, கூர்ம அவதாரங்களின் ஆணவத்தை அடக்கி அணிந்து நிற்கும், எலும்பு, கொம்பு, ஆமை ஓடு முதலானவை தன் திருமார்பில் விளங்க, உமையவளுடன் எருதின் மேல் ஏறி, பொன்போலொளிரும் ஊமத்தை மலர்களாலான மாலை தரித்து, தலையில் கங்கையணிந்து என் உள்ளத்தே நிறைந்ததால், விண்மீனாய் வரும் ஆயில்யம்; ஒன்பதோடு ஒன்று – பத்தாவது விண்மீனான மகம்; ஒன்பதொடு ஏழு – பதினாறாவது விண்மீனான விசாகம்; பதினெட்டாவது விண்மீனான கேட்டை; ஆறாவது விண்மீனான திருவாதிரை; முதலான பயணத்திற்கு விலக்கப்பட்ட நாட்கள் எல்லாமும், சிவனடியார் மீது அன்பொடு அவர்க்கு என்றும் நல்லதையே செய்யும்!"),
    PadalList(
        padalName:
            "உருவளர் பவளமேனி ஒளி நீறணிந்து உமையோடும் வெள்ளை விடை மேல் \nமுருகலர் கொன்றை திங்கள் முடிமேல் அணிந்தென் உளமே புகுந்த அதனால் \nதிருமகள் கலையதூர்தி செயமாது பூமி திசை தெய்வமான பலவும் \nஅருநெதி நல்லநல்ல அவை நல்லநல்ல அடியார் அவர்க்கு மிகவே.",
        padalAssetName: "padal3.mp3",
        padalVarigal:
            "பவளம் போன்ற சிவந்த திருமேனியில் ஒளிபொருந்திய வெண்ணீற்றை அணிந்து, சிவபெருமான் உமையம்மையாரோடு வெள்ளை எருதின்மீது ஏறி வந்து, அழகு பொருந்திய கொன்றையையும் சந்திரனையும் தன் முடிமேல் அணிந்து சிவபெருமான், உமையம்மையாரோடு வெள்ளை எருதின் மீது ஏறி வந்து என் உள்ளத்துள் புகுந்து தங்கியுள்ளான். அதனால், இலக்குமி, கலைகளை வாகனமாகக் கொண்ட கலைமகள், வெற்றித் தெய்வமான துர்க்கை, பூமாது, திசைத் தெய்வங்கள் ஆன பலரும் அரிய செல்வம் போல நன்மை அளிப்பர். அடியவர்களுக்கு மிக நல்லதையே செய்வர்"),
    PadalList(
        padalName:
            "மதிநுதல் மங்கையோடு வடவாலி ருந்து மறையோதும் எங்கள் பரமன்\nநதியொடு கொன்றை மாலை முடிமே லணிந்தென் உளமே புகுந்த அதனால்\nகொதியுறு காலனங்கி நமனோடு தூதர் கொடுநோய் களான பலவும்\nஅதிகுணம் நல்லநல்ல அவை நல்லநல்ல அடியாரவர்க்கு மிகவே.",
        padalAssetName: "padal4.mp3",
        padalVarigal:
            "பிறைபோன்ற நெற்றியை உடைய உமையம்மையாரோடு ஆலமரத்தின்கீழ் இருந்து (வடம் – ஆலமரம்) வேதங்களை அருளிய எங்கள் பரமன், கங்கை நதியையும் கொன்றை மாலையையும் முடிமேல் அணிந்து என் உள்ளத்துள் புகுந்து தங்கியுள்ளான். அதனால், ஆத்திரமுடையதான காலம், அக்கினி, யமன், யமதூதர், கொடிய நோய்கள் எல்லாம் மிக நல்ல குணமுடையன ஆகி நல்லனவே செய்யும். அடியவர்களுக்கு மிகவும் நல்லனவே செய்யும்."),
    PadalList(
        padalName:
            "நஞ்சணி கண்டன் எந்தை மடவாள் தனோடும் விடையேறு நங்கள் பரமன்\nதுஞ்சிருள் வன்னி கொன்றை முடிமேலணிந்தென் உளமே புகுந்த அதனால்\nவெஞ்சின அவுணரோடும் உருமிடியும் மின்னும் மிகையான பூத மவையும்\nஅஞ்சிடும் நல்லநல்ல அவை நல்லநல்ல அடியாரவர்க்கு மிகவே.",
        padalAssetName: "padal5.mp3",
        padalVarigal:
            "விடத்தைக் கழுத்தில் அணிந்த நீலகண்டனும், என் தந்தையும், உமையம்மையாரோடு இடபத்தின் மேல் ஏறி வரும் நம் பரம்பொருள் ஆகிய சிவபெருமான், அடர்ந்து கறுத்த வன்னிமலரையும், கொன்றை மலரையும் தன் முடிமேல் அணிந்து என் உள்ளத்துள் புகுந்து தங்கியுள்ளான். அதனால், கொடிய சினத்தை உடைய அசுரர்கள், முழங்குகிற இடி, மின்னல், துன்பந்தரும் பஞ்ச பூதங்கள் முதலானவையெல்லாம் (நம்மைக் கண்டு) அஞ்சி நல்லனவே செய்யும். அடியவர்களுக்கு மிக நல்லனவே செய்யும்."),
    PadalList(
        padalName:
            "வாள்வரி யதளதாடை வரிகோ வணத்தர் மடவாள் தனோடும் உடனாய்\nநாண்மலர் வன்னிகொன்றை நதிசூடி வந்தென் உளமே புகுந்த அதனால்\nகோளரி யுழுவையோடு கொலையானை கேழல் கொடுநாக மோடு கரடி\nஆளரி நல்லநல்ல அவை நல்லநல்ல அடியாரவர்க்கு மிகவே.",
        padalAssetName: "padal6.mp3",
        padalVarigal:
            " ஒளியும் வரியும் பொருந்திய புலித்தோல் ஆடையும் (வாள் -வரி – அதள் – அது -ஆடை; அதள் -புலித்தோல்), வரிந்து கட்டிய கோவணமும் அணியும் சிவபெருமான் அன்றலர்ந்த மலர்கள், வன்னி இலை, கொன்றைப்பூ, கங்கை நதி ஆகியவற்றைத் தன் முடிமேல் சூடி, உமையம்மையாரோடும் வந்து என் உள்ளத்துள் புகுந்து தங்கியுள்ளான். அதனால், கொல்லும் வலிய புலி (கோளரி உழுவை), கொலையானை, பன்றி (கேழல்), கொடிய பாம்பு, கரடி, சிங்கம் ஆகியன நல்லனவே செய்யும். அடியவர்களுக்கு மிக நல்லனவே செய்யும்."),
    PadalList(
        padalName:
            "செப்பிள முலைநன்மங்கை ஒரு பாகமாக விடையேறு செல்வ னடைவார்\nஒப்பிள மதியும்அப்பும் முடிமே லணிந்தென் உளமே புகுந்த அதனால்\nவெப்பொடு குளிரும்வாதம் மிகையான பித்தும் வினையான வந்து நலியா\nஅப்படி நல்லநல்ல அவை நல்லநல்ல அடியாரவர்க்கு மிகவே.",
        padalAssetName: "padal7.mp3",
        padalVarigal:
            "செம்பு போன்ற இளந்தனங்களை உடைய உமையவளைத் தன் திருமேனியில் ஒரு பாகமாகக் கொண்டு, இடபத்தின் மேல் ஏறிவரும் செல்வனாகிய சிவபெருமான் தன்னை அடைந்த அழகிய பிறைச்சந்திரனையும், கங்கையையும் தன் முடிமேல் அணிந்தவனாய், என் உள்ளத்துள் புகுந்து தங்கியுள்ளான். அதனால், காய்ச்சல் (சுரம்), குளிர்காய்ச்சல், வாதம், மிகுந்த பித்தம் , அவற்றால் வருவன முதலான துன்பங்கள் நம்மை வந்து அடையா. அப்படி அவை நல்லனவே செய்யும். அடியவர்களுக்கு அவை நல்லனவே செய்யும்."),
    PadalList(
        padalName:
            "வேள்பட விழி செய்தன்று விடைமேலிருந்து மடவாள் தனோடும் உடனாய்\nவாண்மதி வன்னிகொன்றை மலர்சூடி வந்தென் உளமே புகுந்த அதனால்\nஏழ்கடல் சூழிலங்கை அரையன்றனோடும் இடரான வந்து நலியா\nஆழ்கடல் நல்லநல்ல அவை நல்லநல்ல அடியாரவர்க்கு மிகவே.",
        padalAssetName: "padal8.mp3",
        padalVarigal:
            "அன்று மன்மதன் அழியும்படி நெற்றிக்கண்ணைத் திறந்து எரித்த சிவபெருமான், இடபத்தின் மேல் உமையம்மையாரோடு உடனாய் இருந்து, தன் முடிமேல் ஒளி பொருந்திய பிறைச்சந்திரன், வன்னி இலை, கொன்றை மலர் ஆகியனவற்றைச் சூடி வந்து என் உள்ளத்துள் புகுந்து தங்கியுள்ளான். அதனால், ஏழ் கடல்களால் சூழப்பட்ட இலங்கையின் மன்னன் ஆன இராவணன் (பிறன்மனை நாடியதாலேற்பட்டது) போன்ற இடர்களும் வந்து நம்மைத் துன்புறுத்தா. ஆழமான கடலும் நமக்கு நல்லனவே செய்யும். அடியவர்களுக்கு அவை நல்லனவே செய்யும்."),
    PadalList(
        padalName:
            "பலபல வேடமாகும் பரனாரி பாகன் பசுவேறும் எங்கள் பரமன்\nசலமகளோடு எருக்கு முடிமேலணிந்தென் உளமே புகுந்த அதனால்\nமலர்மிசை யோனுமாலும் மறையோடு தேவர் வருகால மான பலவும்\nஅலைகடல் மேருநல்ல அவை நல்லநல்ல அடியாரவர்க்கு மிகவே.",
        padalAssetName: "padal9.mp3",
        padalVarigal:
            "பல்வேறு கோலங்கள் கொள்கிற பரம்பொருள் ஆகிறவனும், மாதொருபாகனும், எருதின் மேல் ஏறிவரும் எங்கள் பரமனுமாகிய சிவபெருமான், தன் முடிமேல் கங்கை, எருக்கமலர் ஆகியவற்றை அணிந்து வந்து என் உள்ளத்துள் புகுந்து தங்கியுள்ளான். அதனால், தாமரைமலர் மேல் உறையும் பிரமன், திருமால், வேதங்கள், தேவர்கள் ஆகியோரும், எதிர்காலம், அலையுடைய கடல், மேரு முதலான மலைகள் ஆகியவையும் நமக்கு நல்லனவே செய்வர். அடியவர்களுக்கு அவை மிகவும் நல்லனவே செய்யும்."),
    PadalList(
        padalName:
            "கொத்தலர் குழலியோடு விசயற்கு நல்கு குணமாய வேட விகிர்தன்\nமத்தமு மதியு(ம்)நாகம் முடிமே லணிந்தென் உளமே புகுந்த அதனால்\nபுத்தரோடமணை வாதில் அழிவிக்கும் அண்ணல் திருநீறு செம்மை திடமே\nஅத்தகு நல்ல நல்ல அவை நல்ல நல்ல அடியார் அவர்க்கு மிகவே.",
        padalAssetName: "padal10.mp3",
        padalVarigal:
            "கூந்தலில் மலர்க்கொத்துகள் அணிந்த உமையம்மையாரோடு வேட வடிவில் சென்று அருச்சுனனுக்கு அருள்புரிந்த தன்மை கொண்ட சிவபெருமான், தன் முடி மேல் ஊமத்தை மலர், பிறைச்சந்திரன், பாம்பு ஆகியவற்றை அணிந்து வந்து என் உள்ளத்துள் புகுந்து தங்கியுள்ளான். அதனால், புத்தர்களையும் சமணர்களையும் ஈசனின் திருநீறு வாதில் தோற்றோடச் செய்யும். அதன் பெருமை நிச்சயமே. எல்லாம் அப்படிச் சிறந்த நல்லனவற்றையே செய்யும். அவை மிகவும் நல்லனவே செய்யும்."),
    PadalList(
        padalName:
            "தேனமர் பொழில் கொளாலை விளைசெந்நெல் துன்னி வளர்செம்பொன் எங்கும் நிகழ \nநான்முகன் ஆதியாய பிரமா புரத்து மறைஞான ஞான முனிவன்\nதானுறு கோளும்நாளும் அடியாரை வந்து நலியாத வண்ணம் உரைசெய்\nஆன சொல் மாலையோதும் அடியார்கள் வானில் அரசாள்வர் ஆணை நமதே.",
        padalAssetName: "padal11.mp3",
        padalVarigal:
            "தேன் நிறைந்த பூங்காக்களைக் கொண்டதும், கரும்பும் (ஆலை), விளைகிற செந்நெல்லும் நிறைந்துள்ளதும், பொன் போல் ஒளிர்வதும், நான்முகன் (வழிபட்ட) காரணத்தால் பிரமாபுரம் என்ற ஊரில் தோன்றி அபரஞானம் பரஞானம் ஆகிய இரு வகை ஞானங்களையும் உணர்ந்த ஞானசம்பந்தனாகிய யான், தாமே வந்து சம்பவிக்கும் நவக்கிரகங்கள், நாள் நட்சத்திரம், போன்றன எல்லாம் அடியவரை வந்து வருத்தாதவாறு பாடிய இப்பதிகத்தை ஓதும் அடியவர்கள் வானுலகில் அரசு புரிவர். இது நமது ஆணை.")
  ];

  void _handleOnPressed(int index) async {
    if (selectedIndex == index) {
      if (audioPlayer.state == PlayerState.playing) {
        await audioPlayer.pause();
      } else if (audioPlayer.state == PlayerState.paused) {
        await audioPlayer.resume();
      } else if (audioPlayer.state == PlayerState.completed ||
          audioPlayer.state == PlayerState.stopped) {
        await audioPlayer
            .play(AssetSource(padalListItems[index].padalAssetName));
      }
    } else {
      selectedIndex = index;
      await audioPlayer.play(AssetSource(padalListItems[index].padalAssetName));
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _appBarColor = _scrollController.offset > 300
              ? const Color.fromARGB(255, 3, 19, 48)
              : Colors.white;

          if (_scrollController.offset > 300) {
            systemUiOverlayStyle = SystemUiOverlayStyle.dark.copyWith(
                statusBarColor: Colors.transparent,
                systemNavigationBarColor: Colors.white);
          } else {
            systemUiOverlayStyle = SystemUiOverlayStyle.light.copyWith(
                statusBarColor: Colors.transparent,
                systemNavigationBarColor: Colors.white);
          }
        });
      });
    audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        audioPlayer.state = PlayerState.completed;
      });
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      setState(() {
        audioPlayer.stop();
        audioPlayer.state = PlayerState.completed;
      });
    }
  }

  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        CustomSliverAppBar(
          title: "கோளறு திருப்பதிகம்",
          appBarColor: _appBarColor,
          imageAssetPath: 'lib/images/shiva5.jpg',
          systemStyle: systemUiOverlayStyle,
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                    //color: Colors.lightGreen,
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "திருஞான சம்பந்தர் அருளிய கோளறு திருப்பதிகம்",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.muktaMalar(
                        fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                )),
              ),
            ],
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
            child: Column(
              children: [
                Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: Text(
                          padalListItems[index].padalName,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.muktaMalar(fontSize: 16),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(8, 2, 8, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton.icon(
                                  style: flatButtonStyle,
                                  onPressed: () => showDetail(index),
                                  icon: Icon(Icons.article, size: 20),
                                  label: Text(
                                    "விளக்கம்",
                                    style: GoogleFonts.muktaVaani(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  )),
                              TextButton.icon(
                                style: flatButtonStyle,
                                icon: Icon(
                                  selectedIndex == index &&
                                          audioPlayer.state ==
                                              PlayerState.playing
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                ),
                                label: Text("கேட்க",
                                    style: GoogleFonts.muktaVaani(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                onPressed: () => _handleOnPressed(index),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          );
        }, childCount: padalListItems.length)),
        SliverToBoxAdapter(
            child: SizedBox(
                child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "~~~ திருச்சிற்றம்பலம் ~~~",
            textAlign: TextAlign.center,
            style: GoogleFonts.muktaMalar(fontSize: 20,fontWeight:FontWeight.w600),
          ),
        )))
      ],
    );
  }

  void showDetail(int index) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text("விளக்கம்",
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    padalListItems[index].padalVarigal,
                    style: GoogleFonts.muktaMalar(fontSize: 16),
                  ),
                ),
                SizedBox(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "திருச்சிற்றம்பலம்",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.muktaMalar(fontSize: 20),
                  ),
                ))
              ],
            ),
          ),
        );
      },
    );
  }
}
