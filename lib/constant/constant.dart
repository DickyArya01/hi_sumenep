// jarak
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double x8 = 8;
const double x16 = 16;
const double x24 = 24;
const double x32 = 32;
const double x40 = 40;
const double x80 = 80;
const double sizeOfIcon = 30;
double visualHeight(context) {
  return MediaQuery.of(context).size.height;
}

double visualWidth(context) {
  return MediaQuery.of(context).size.width;
}

const String google_api_key = "AIzaSyBoTwTtRhDRCLzK-BXserBNwHpJGMiLEi4";

const String logo = 'assets/logo.png';
const String slide= 'assets/slide.png';

const String url = 'https://source.unsplash.com/user/c_v_r/1900x800';

// Text
const String hintText = 'Mau kemana hari ini ?';
const String panelSlideHint = 'wisata';


//theme

Color kBlackColor = Color(0xff222222);
Color kBlackAccentColor = Color(0xff2A2B37);
Color kGreyColor = Color(0xff94959B);
Color kLineDarkColor = Color(0xffEAEAEA);
Color kWhiteGreyColor = Color(0xffF1F1F5);
Color kWhiteColor = Color(0xffFFFFFF);
Color kRedColor = Color(0xffFF314A);
Color kYellowColor = Color(0xffFFBA00);
Color kBlueColor = Color(0xff2972FF);
Color kDarkBackgroundColor = Color(0xff252836);

TextStyle blackTextStyle = GoogleFonts.nunito(
  color: kBlackColor,
);
TextStyle blackAccentTextStyle = GoogleFonts.nunito(
  color: kBlackAccentColor,
);
TextStyle greyTextStyle = GoogleFonts.nunito(
  color: kGreyColor,
);
TextStyle lineDarkTextStyle = GoogleFonts.nunito(
  color: kLineDarkColor,
);
TextStyle whiteGreyTextStyle = GoogleFonts.nunito(
  color: kWhiteGreyColor,
);
TextStyle whiteTextStyle = GoogleFonts.nunito(
  color: kWhiteColor,
);
TextStyle redTextStyle = GoogleFonts.nunito(
  color: kRedColor,
);
TextStyle yellowTextStyle = GoogleFonts.nunito(
  color: kYellowColor,
);
TextStyle blueTextStyle = GoogleFonts.nunito(
  color: kBlueColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;


