import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SystemUi {

  SystemUiOverlayStyle getUiStyles(statusBarColor, statusBarIconBrightness,systemNavigationBarColor){

    return SystemUiOverlayStyle(
        statusBarColor:statusBarColor,
        statusBarIconBrightness: statusBarIconBrightness,
        systemNavigationBarColor:  systemNavigationBarColor,

    );
  }
  
}