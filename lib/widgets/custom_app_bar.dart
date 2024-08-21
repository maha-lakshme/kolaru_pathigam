import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  String title;
  Color surfaceTintColor;
  Color backgroundColor;
  Color titleTextColor;
  double? fontSize;

  CustomAppBar({
    required this.title, required this.surfaceTintColor,required this.backgroundColor,required this.titleTextColor,required this.fontSize
  });
 
 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      centerTitle: true,
      title: Text(title,style: GoogleFonts.muktaMalar(
                    textStyle: TextStyle(
                        color: titleTextColor,
                        fontFamily: GoogleFonts.muktaMalar.toString(),
                        fontSize: fontSize,
                        fontWeight: FontWeight.w600)),),
      surfaceTintColor: surfaceTintColor,
      backgroundColor: backgroundColor,

    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}