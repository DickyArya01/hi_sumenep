import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hi_sumenep_app/api/dummyRepo.dart';
import 'package:hi_sumenep_app/constant/constant.dart';
import 'package:hi_sumenep_app/page/detail.dart';
import 'package:http/http.dart';

Container cardImage(context, String url) {
  return Container(
    width: visualWidth(context),
    height: visualHeight(context) * 0.3,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      image: DecorationImage(
        image: NetworkImage(
          apiGambar+'galeri/1662481254.png',
        ),
        fit: BoxFit.cover,
      ),
    ),
  );
}

SizedBox blackText(
    String title, double size, double topPadding, double leftPadding, context) {
  return SizedBox(
    width: visualWidth(context) * 0.6,
    child: Container(
      margin: EdgeInsets.only(
        left: leftPadding,
        top: topPadding,
      ),
      child: Text(
        title,
        style: blackTextStyle.copyWith(
          fontSize: size,
          fontWeight: semiBold,
        ),
        maxLines: 1
      ),
    ),
  );
}

Stack cardItem(context, String title, String url, String desc) {
  return Stack(
    children: [
      Container(
        margin: EdgeInsets.symmetric(vertical: x16),
        width: visualWidth(context),
        height: visualHeight(context) * 0.46,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 6,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                cardImage(context, url),
                blackText(title, 16, 8, 24, context),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: x24),
                  child: Text(desc,
                      maxLines: 2,
                      style: greyTextStyle.copyWith(
                          fontSize: 16, fontWeight: medium)),
                ),
              ],
            ),
          ],
        ),
      )
    ],
  );
}

class CustomCard1 extends StatefulWidget {
  final wisata;
  // final galeri;
  CustomCard1({required this.wisata, 
  // required this.galeri
  });

  @override
  State<CustomCard1> createState() => _CustomCard1State();
}

class _CustomCard1State extends State<CustomCard1> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Detail(wisata: widget.wisata)));
        },
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: x16),
              width: visualWidth(context),
              height: visualHeight(context) * 0.46,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 6,
                    offset: const Offset(1, 1),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      cardImage(context, 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          blackText('${widget.wisata.title}', 16, 12, 24, context),
                          Container(
                            margin: EdgeInsets.only(right: 24, top: 12),
                            child: Expanded(
                              child: (widget.wisata.price >999999)
                              ?Text(
                                'IDR ${(widget.wisata.price/1000000).toString().replaceAll(regex, '')}jt',
                                style: blueTextStyle.copyWith(
                                    fontSize: 16, fontWeight: semiBold),
                              ) 
                              :Text(
                                'IDR ${(widget.wisata.price/1000).toString().replaceAll(regex, '')}k',
                                style: blueTextStyle.copyWith(
                                    fontSize: 16, fontWeight: semiBold),
                              ) 
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: x24),
                        margin: EdgeInsets.only(top: 8),
                        child: Text(widget.wisata.desc,
                            maxLines: 2,
                            style: greyTextStyle.copyWith(
                                fontSize: 16, fontWeight: medium)),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
