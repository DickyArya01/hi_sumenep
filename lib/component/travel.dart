import 'package:flutter/material.dart';
import 'package:hi_sumenep_app/constant/constant.dart';

import '../page/detail.dart';

GestureDetector travelComponent(String text, String link) {
  return GestureDetector(
    onTap: () {
      print(link);
    },
    child: Container(
      margin: EdgeInsets.only(right: x8),
      child: Column(
        children: [
          Icon(
            Icons.account_circle_outlined,
            color: kBlueColor,
            size: 32,
          ),
           Flexible(
             child: Container(
               child: SizedBox(
                 width: 60,
                 child: RichText(
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    strutStyle: StrutStyle(fontSize: 12.0),
                    text: TextSpan(
                        style: blackTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: medium
                        ),
                        text: text),
                  ),
               ),
             ),
           ),
        ],
      ),
    ),
  );
}
