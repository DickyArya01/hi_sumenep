
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hi_sumenep_app/constant/constant.dart';

AppBar homeAppbar() {
  return AppBar(
    title: Image.asset(logo),
    backgroundColor: Colors.white,
    shadowColor: Colors.white,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ), //rubah warna status bar
    elevation: 0, // menghilangkan shadow
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: x16),
          child: Row(
            children: [
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(x24),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: hintText,
                ),
              )),
              GestureDetector(
                onTap: () {},
                child: Container(
                    margin: const EdgeInsets.only(left: x24),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(x8),
                    ),
                    child: Transform.rotate(
                      angle: pi / 2,
                      child: const Icon(
                        Icons.candlestick_chart_rounded,
                        color: Colors.white,
                        size: 38,
                      ),
                    )),
              )
            ],
          ),
        )),
  );
}

