import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hi_sumenep_app/api/dummyRepo.dart';
import 'package:hi_sumenep_app/component/card%20copy.dart';
import 'package:hi_sumenep_app/component/card.dart';
import 'package:hi_sumenep_app/constant/constant.dart';
import 'package:http/http.dart';

class PanelWidget extends StatefulWidget {
  ScrollController controller;
  int indexCategory;
  final Function(String)? onTap;

  PanelWidget(
      {Key? key,
      required this.controller,
      required this.indexCategory,
      this.onTap})
      : super(key: key);

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  List<Data> data = [];

  @override
  void initState() {
    super.initState();
    fetchWisata();
  }

  fetchWisata() async {
    final responseKategori =
        await get(Uri.parse(api+wisata));

    if (responseKategori.statusCode == 200) {
      var responseKategoriJson = json.decode(responseKategori.body);

      print(responseKategoriJson);

      setState(() {
        data = (responseKategoriJson[0]['data'] as List)
            .map((e) => Data.fromJson(e))
            .toList();
      });
    } else {
      throw Exception('gagal ${responseKategori.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          buildDragHandle(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: x16),
            child: Center(
              child: Text(
                '${data.length} $panelSlideHint',
                style: blackAccentTextStyle.copyWith(
                    fontSize: 16, fontWeight: semiBold),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: x16),
                controller: widget.controller,
                itemCount: data.length,
                itemBuilder: (context, int index) =>
                    CustomCard1(wisata: data[index], galeri: data[index].id,)),
          ),
          Container(
            margin: EdgeInsets.only(top: 2),
          )
        ],
      );

  Widget buildDragHandle() => GestureDetector(
        onTap: () {
        },
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(top: x8),
            width: 30,
            height: 5,
            decoration: BoxDecoration(color: Colors.grey[400]),
          ),
        ),
      );
}
