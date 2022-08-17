import 'package:flutter/material.dart';
import 'package:hi_sumenep_app/constant/constant.dart';

ElevatedButton customButton(
    String text,
    Color color,
    BorderSide borderSide,
    TextStyle textStyle,
    double fontSize,
    FontWeight fontWeight,
    void onPressed) {
  return ElevatedButton(
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
                side: BorderSide.none))),
    onPressed: () {
      onPressed;
    },
    child: Container(
        padding: const EdgeInsets.symmetric(vertical: x16),
        child: Text(
          text,
          style: textStyle.copyWith(
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        )),
  );
}
