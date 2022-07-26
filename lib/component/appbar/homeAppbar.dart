import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hi_sumenep_app/constant/constant.dart';
import 'package:hi_sumenep_app/icon/icon_app_icons.dart';

AppBar homeAppbar() {
  return AppBar(
    backgroundColor: Colors.white,
    shadowColor: Colors.white,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ), //rubah warna status bar
    elevation: 0, // menghilangkan shadow
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(2),
        child: Container(
          height: 52,
          margin: const EdgeInsets.symmetric(horizontal: x16),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: x8),
                decoration: BoxDecoration(
                    color: kBlueColor, shape: BoxShape.circle),
                child: Icon(
                  IconApp.iconApp,
                  color: kWhiteColor,
                  size: 48,
                ),
              ),
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(x24),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: hintText,
                  hintStyle: greyTextStyle,
                ),
              )),
            ],
          ),
        )),
  );
}
