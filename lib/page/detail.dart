import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hi_sumenep_app/api/dummyRepo.dart';
import 'package:hi_sumenep_app/component/map.dart';
import 'package:hi_sumenep_app/constant/constant.dart';

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
              width: 40,
              margin: const EdgeInsets.only(right: x8), 
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: IconButton(
              onPressed: () {}, 
              icon: Icon(
                Icons.favorite,
                color: Colors.grey,)))],
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
                    Text(widget.wisata.title),
                    Text('Kecamatan socah')
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [Text('IDR 5000'), Text('per orang')],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: x16, horizontal: x16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text('Deskripsi'), Text(widget.wisata.desc)],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: x8, horizontal: x16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text('Fasilitas'), Text('Grid Fasilitas')],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: x8, horizontal: x16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 16)),
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
                Text('Lokasi'),
                Text('kec. apah, kabupaten apah'),
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
                Text('Travel'),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: x8),
                      child: Column(
                        children: [Icon(Icons.abc), Text('Travel 1')],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: x8),
                      child: Column(
                        children: [Icon(Icons.abc), Text('Travel 2')],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: x8),
                      child: Column(
                        children: [Icon(Icons.abc), Text('Travel 3')],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: x8, horizontal: x16),
            child: Text('Komentar'),
          )
        ])),
        SliverList(
            delegate: SliverChildBuilderDelegate(childCount: komen.length,
                (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: x8, horizontal: x16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(komen[index].user), Text(komen[index].comment)],
            ),
          );
        })),
      ],
    ));
  }
}
