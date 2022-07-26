import 'package:flutter/material.dart';
import 'package:hi_sumenep_app/api/dummyRepo.dart';
import 'package:hi_sumenep_app/constant/constant.dart';
import 'package:hi_sumenep_app/page/detail.dart';

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
          url,
        ),
        fit: BoxFit.cover,
      ),
    ),
  );
}

Container blackText(
    String title, double size, double topPadding, double leftPadding) {
  return Container(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                cardImage(context, url),
                blackText(title, 16, 8, 24),
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

class CustomCard extends StatefulWidget {
  final Wisata wisata;

  CustomCard({required this.wisata});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // Navigator.push(
              // context,
              // MaterialPageRoute(
                  // builder: (context) => Detail(wisata: widget.wisata)));
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
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      cardImage(context, widget.wisata.url),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          blackText(widget.wisata.title, 16, 12, 24),
                          Container(
                            margin: EdgeInsets.only(right: 24, top: 12),
                            child: Text(
                              'IDR ${widget.wisata.price}',
                              style: blueTextStyle.copyWith(
                                  fontSize: 16, fontWeight: semiBold),
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
