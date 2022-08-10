
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hi_sumenep_app/constant/constant.dart';

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
        preferredSize: const Size.fromHeight(x8),
        child: Container(
          height: 52,
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
                    icon: Icon(Icons.abc),
                  ),
              )),
            ],
          ),
        )),
  );
}

