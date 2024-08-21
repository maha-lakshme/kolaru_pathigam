import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kolaru_pathigam/widgets/custom_app_bar.dart';

class CustomSliverAppBar extends StatelessWidget {
  String title;
  Color appBarColor;
  String imageAssetPath;
SystemUiOverlayStyle systemStyle;
  CustomSliverAppBar(
      {required this.title,
      required this.appBarColor,
      required this.imageAssetPath,required this.systemStyle});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        expandedHeight: 380.0,
        systemOverlayStyle: systemStyle,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
        bottom: CustomAppBar(
          title: title,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          titleTextColor: appBarColor,
          fontSize: 20,
        ),
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          background: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
            child: Image.asset(
              imageAssetPath, // this image will replace the AppBar when scrolled
              fit: BoxFit.cover,
            ),
          ),
        ),
        pinned: true,
        snap: false,
        floating: true);
  }
}
