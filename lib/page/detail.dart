import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hi_sumenep_app/api/dummyRepo.dart';
import 'package:hi_sumenep_app/component/map.dart';
import 'package:hi_sumenep_app/constant/constant.dart';

Text styleText(String text, double size, FontWeight weight, Color color) {
  return Text(
    text,
    style: (color == kBlackColor)
        ? blackTextStyle.copyWith(
            fontSize: size,
            fontWeight: weight,
          )
        : (color == kBlueColor)
        ?blueTextStyle.copyWith(
            fontSize: size,
            fontWeight: weight,
          )
        :greyTextStyle.copyWith(
            fontSize: size,
            fontWeight: weight,
          ),
  );
}

class Detail extends StatefulWidget {
  final Wisata wisata;
  const Detail({Key? key, required this.wisata}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          leadingWidth: 40,
          leading: Container(
            margin: const EdgeInsets.only(left: x8),
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              color: Colors.black,
              icon: const Icon(Icons.arrow_back),
              iconSize: 20,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          actions: [
            Container(
                width: 32,
                margin: const EdgeInsets.only(right: x8),
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.grey,
                    )))
          ],
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light,
          ), //rubah warna status bar
          stretch: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              widget.wisata.url,
              fit: BoxFit.cover,
            ),
          ),
          pinned: true,
          expandedHeight: visualHeight(context) * 0.394,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            padding: const EdgeInsets.symmetric(vertical: x8, horizontal: x16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    styleText(widget.wisata.title, 18, bold, kBlackColor),
                    styleText('Kecamatan Socah', 12, semiBold, kBlueColor)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    styleText('IDR 5000', 16, semiBold, kBlackColor), 
                    styleText('per orang', 12, semiBold, kBlueColor)],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: x16, horizontal: x16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: styleText('Deskripsi', 14, semiBold, kBlackColor)), 
                styleText(widget.wisata.desc, 12, medium, kBlackColor)],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: x8, horizontal: x16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: styleText('Fasilitas', 14, semiBold, kBlackColor)),
                SizedBox(
                    height: visualHeight(context) * 0.4,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          return Icon(Icons.abc);
                        }))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: x8, horizontal: x16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  textStyle: whiteTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold
                  )),
              onPressed: () {},
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: x16),
                  child: Text('Tampilkan fasilitas lainnya')),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: x8, horizontal: x16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: styleText('Lokasi', 14, semiBold, kBlackColor)),
                styleText('Detail lokasi', 12, semiBold, kGreyColor),
                GestureDetector(
                  onDoubleTap: () {
                    print('klik');
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: x8),
                    height: visualHeight(context) * 0.3,
                    child: MapSample(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: x8, horizontal: x16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: styleText('Travel', 14, semiBold, kBlackColor)),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: x8),
                      child: Column(
                        children: [Icon(Icons.abc), styleText('Travel 1', 12, medium, kBlackColor)],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: x8),
                      child: Column(
                        children: [Icon(Icons.abc), styleText('Travel 2', 12, medium, kBlackColor)],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: x8),
                      child: Column(
                        children: [Icon(Icons.abc), styleText('Travel 3', 12, medium, kBlackColor)],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: x8, horizontal: x16),
            child: styleText('Komentar', 14, semiBold, kBlackColor),
          )
        ])),
        SliverList(
            delegate: SliverChildBuilderDelegate(childCount: komen.length,
                (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: x8, horizontal: x16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                styleText(komen[index].user, 12, semiBold, kBlackColor),
                styleText('day month year', 10, medium, kGreyColor), 
                styleText(komen[index].comment, 12, semiBold, kBlackColor)],
            ),
          );
        })),
      ],
    ));
  }
}
