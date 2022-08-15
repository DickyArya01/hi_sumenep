import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hi_sumenep_app/constant/constant.dart';

AppBar profileAppbar() {
  return AppBar(
    title: Center(
      child: Text(
        'Profile',
        style: blackTextStyle.copyWith(
          fontSize: 16,
          fontWeight: semiBold 
        ),),
    ),
    backgroundColor: Colors.white,
    shadowColor: Colors.white,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light,
    ), //rubah warna status bar
  );
}
