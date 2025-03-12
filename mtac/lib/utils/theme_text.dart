import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class PrimaryFont{

  static String fontfamily ='Raleway';

  // text header
  static TextStyle headerTextThin(){
    return TextStyle(
      fontFamily: fontfamily,
      fontWeight: FontWeight.w100,
      fontSize: 5.w,
    );
  }
  static TextStyle headerTextLight(){
    return TextStyle(
      fontFamily: fontfamily,
      fontWeight: FontWeight.w300,
      fontSize: 5.w,
    );
  }
  static TextStyle headerTextMedium(){
    return TextStyle(
      fontFamily: fontfamily,
      fontWeight: FontWeight.w500,
      fontSize: 5.w,
    );
  }
  static TextStyle headerTextBold(){
    return TextStyle(
      fontFamily: fontfamily,
      fontWeight: FontWeight.w700,
      fontSize: 5.w,
    );
  }

  // text body
    static TextStyle bodyTextThin(){
    return TextStyle(
      fontFamily: fontfamily,
      fontWeight: FontWeight.w100,
      fontSize: 3.w,
    );
  }
  static TextStyle bodyTextLight(){
    return TextStyle(
      fontFamily: fontfamily,
      fontWeight: FontWeight.w300,
      fontSize: 3.w,
    );
  }
  static TextStyle bodyTextMedium(){
    return TextStyle(
      fontFamily: fontfamily,
      fontWeight: FontWeight.w500,
      fontSize: 3.w,
    );
  }
  static TextStyle bodyTextBold(){
    return TextStyle(
      fontFamily: fontfamily,
      fontWeight: FontWeight.w700,
      fontSize: 3.w,
    );
  }

  // text note
    static TextStyle noteTextThin(){
    return TextStyle(
      fontFamily: fontfamily,
      fontWeight: FontWeight.w100,
      fontSize: 10.h,
    );
  }
  static TextStyle noteTextLight(){
    return TextStyle(
      fontFamily: fontfamily,
      fontWeight: FontWeight.w300,
      fontSize: 10.h,
    );
  }
  static TextStyle noteTextMedium(){
    return TextStyle(
      fontFamily: fontfamily,
      fontWeight: FontWeight.w500,
      fontSize: 10.h,
    );
  }
  static TextStyle noteTextBold(){
    return TextStyle(
      fontFamily: fontfamily,
      fontWeight: FontWeight.w700,
      fontSize: 10.h,
    );
  }

}

extension GetOrientation on BuildContext{
  Orientation get orientation => MediaQuery.of(this).orientation;
}

extension GetSize on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
}