import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hi_sumenep_app/api/dummyRepo.dart';
import 'package:hi_sumenep_app/component/customButton.dart';
import 'package:hi_sumenep_app/component/map.dart';
import 'package:hi_sumenep_app/component/travel.dart';
import 'package:hi_sumenep_app/constant/constant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Text styleText(String text, double size, FontWeight weight, Color color) {
  return Text(
    text,
    style: (color == kBlackColor)
        ? blackTextStyle.copyWith(
            fontSize: size,
            fontWeight: weight,
          )
        : (color == kBlueColor)
            ? blueTextStyle.copyWith(
                fontSize: size,
                fontWeight: weight,
              )
            : greyTextStyle.copyWith(
                fontSize: size,
                fontWeight: weight,
              ),
  );
}

Widget buildImage(String url, int index) {
  return Image.network(
    url,
    fit: BoxFit.cover,
  );
}

class Detail extends StatefulWidget {
  final Wisata wisata;
  const Detail({Key? key, required this.wisata}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool isFavourited = false;
  int activePhotoIndex = 0;
  int indexKiri = -2;
  int indexKanan = -1;

  SnackBar snackBar(String text, Color color) {
    return SnackBar(
      content: Text(
        text,
        style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
      ),
      backgroundColor: color,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (dataFav.contains(widget.wisata)) {
      isFavourited = true;
    }
  }

  void onPress() {
    print("di click");
  }

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
                    onPressed: () {
                      if (!dataFav.contains(widget.wisata)) {
                        setState(() {
                          dataFav.add(widget.wisata);
                          isFavourited = true;
                          ScaffoldMessenger.of(context).showSnackBar(
                              snackBar(favouriteAdded, kGreenColor));
                        });
                      } else {
                        setState(() {
                          dataFav.remove(widget.wisata);
                          isFavourited = false;
                          ScaffoldMessenger.of(context).showSnackBar(
                              snackBar(favouriteRemoved, Colors.redAccent));
                        });
                      }
                    },
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    icon: (isFavourited == false)
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.grey,
                          )
                        : const Icon(
                            Icons.favorite,
                            color: Colors.red,
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
              background: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CarouselSlider.builder(
                itemCount: images.length,
                options: CarouselOptions(
                  height: visualHeight(context),
                  viewportFraction: 1.0,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  autoPlay: true,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activePhotoIndex = index;
                    });
                  },
                ),
                itemBuilder: (context, index, realIndex) {
                  final ImageUrl = images[index];
                  return buildImage(ImageUrl, index);
                },
              ),
              Container(
                margin: EdgeInsets.only(bottom: x16, right: x16),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                    color: kBlackColor, borderRadius: BorderRadius.circular(4)),
                child: Text(
                  '${activePhotoIndex + 1} / ${images.length}',
                  style: whiteTextStyle,
                ),
              ),
            ],
          )),
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
                    styleText('IDR ${widget.wisata.price}', 16, semiBold,
                        kBlackColor),
                    styleText('per orang', 12, semiBold, kBlueColor)
                  ],
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
                styleText(widget.wisata.desc, 12, medium, kBlackColor)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: x16),
            margin: EdgeInsets.only(top: x16),
            child: styleText('Fasilitas', 14, semiBold, kBlackColor),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: x16),
            margin: EdgeInsets.only(bottom: x16),
            child: SizedBox(
              height: visualHeight(context) * 0.16,
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 8),
                  shrinkWrap: true,
                  itemCount: fasilitas.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Text(
                          '\u2022',
                          style: blackTextStyle.copyWith(
                              fontSize: 12, fontWeight: medium),
                        ),
                        Text(fasilitas[index].name,
                            style: blueTextStyle.copyWith(
                                fontSize: 12, fontWeight: medium))
                      ],
                    );
                  }),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: x8, horizontal: x16),
              child: customButton('Tampilkan fasilitas lainnya', kBlueColor,
                  BorderSide.none, whiteTextStyle, 14, semiBold, onPress())),
          Container(),
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
                SizedBox(
                  height: visualHeight(context) * 0.1,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: travel.length,
                      itemBuilder: (context, index) {
                        return travelComponent(
                            travel[index].name, travel[index].link);
                      }),
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
            padding: const EdgeInsets.symmetric(vertical: x8, horizontal: x8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 8),
                  width: visualWidth(context) * 0.18,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://www.99.co/blog/indonesia/wp-content/uploads/2022/06/foto-profil-wa-keren-pakai-kacamata.jpg'),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    styleText(komen[index].user, 12, semiBold, kBlackColor),
                    styleText('day month year', 10, medium, kGreyColor),
                    Container(
                        width: visualWidth(context) * 0.7,
                        child: RichText(
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            text: TextSpan(
                                style: blackTextStyle.copyWith(
                                    fontSize: 12, fontWeight: medium),
                                text: komen[index].comment)))
                  ],
                ),
              ],
            ),
          );
        })),
      ],
    ));
  }
}
