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
const String slide = 'assets/slide.png';


const String url = 'https://source.unsplash.com/user/c_v_r/1900x800';

// Text
const String hintText = 'Mau kemana hari ini ?';
const String panelSlideHint = 'wisata';

const String favouriteAdded = 'Ditambahkan ke favourite';
const String favouriteRemoved = 'Dihapus dari favourite';
const String notLogin = "Login terlebih dahulu untuk menyimpan favourite";

//theme

Color kBlackColor = Color(0xff222222);
Color kBlackAccentColor = Color.fromARGB(255, 50, 51, 63);
Color kGreyColor = Color(0xff94959B);
Color kLineDarkColor = Color(0xffEAEAEA);
Color kWhiteGreyColor = Color(0xffF1F1F5);
Color kWhiteColor = Color(0xffFFFFFF);
Color kBlueColor = Color(0xff1581B7);
Color kBlueAccentColor = Color.fromARGB(138, 122, 209, 253);
Color kDarkBackgroundColor = Color(0xff252836);
Color kGreenColor = Color(0xff3CB371);
Color kRedColor = Color(0xffFF314A);

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: kBlackColor,
);
TextStyle blueAccentTextStyle = GoogleFonts.poppins(
  color: kBlueAccentColor,
);
TextStyle blackAccentTextStyle = GoogleFonts.poppins(
  color: kBlackAccentColor,
);
TextStyle greyTextStyle = GoogleFonts.poppins(
  color: kGreyColor,
);
TextStyle lineDarkTextStyle = GoogleFonts.poppins(
  color: kLineDarkColor,
);
TextStyle whiteGreyTextStyle = GoogleFonts.poppins(
  color: kWhiteGreyColor,
);
TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: kWhiteColor,
);
TextStyle blueTextStyle = GoogleFonts.poppins(
  color: kBlueColor,
);
TextStyle redTextStyle = GoogleFonts.nunito(
  color: kRedColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight black = FontWeight.w900;
