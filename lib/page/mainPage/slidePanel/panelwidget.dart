
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hi_sumenep_app/constant/constant.dart';

class Dummy {
  String title;
  String url;
  String desc;

  Dummy({required this.title, required this.url, required this.desc});
}

List<Dummy> dataDummmy = [
  Dummy(
      title: 'Data Wisata ',
      url:
          logo,
      desc: 'ini pantai slopeng'),
  Dummy(
      title: 'Data Wisata ',
      url:
          logo,
      desc: 'ini pantai slopeng'),
  Dummy(
      title: 'Data Wisata ',
      url:
          logo,
      desc: 'ini pantai slopeng'),
  Dummy(
      title: 'Data Wisata ',
      url:
          logo,
      desc: 'ini pantai slopeng'),
  Dummy(
      title: 'Data Wisata ',
      url:
          logo,
      desc: 'ini pantai slopeng'),
  Dummy(
      title: 'Data Wisata ',
      url:
          logo,
      desc: 'ini pantai slopeng'),
  Dummy(
      title: 'Data Wisata ',
      url:
          logo,
      desc: 'ini pantai slopeng'),
  Dummy(
      title: 'Data Wisata ',
      url:
          logo,
      desc: 'ini pantai slopeng'),
  Dummy(
      title: 'Data Wisata ',
      url:
          logo,
      desc: 'ini pantai slopeng'),
  Dummy(
      title: 'Data Wisata ',
      url:
          logo,
      desc: 'ini pantai slopeng'),
  Dummy(
      title: 'Data Wisata ',
      url:
          logo,
      desc: 'ini pantai slopeng'),
  Dummy(
      title: 'Data Wisata ',
      url:
          logo,
      desc: 'ini pantai slopeng'),
  Dummy(
      title: 'Data Wisata ',
      url:
          logo,
      desc: 'ini pantai slopeng'),
  Dummy(
      title: 'Data Wisata ',
      url:
          logo,
      desc: 'ini pantai slopeng'),
  Dummy(
      title: 'Data Wisata ',
      url:
          logo,
      desc: 'ini pantai slopeng'),
  Dummy(
      title: 'Data Wisata ',
      url:
          logo,
      desc: 'ini pantai slopeng'),
  Dummy(
      title: 'Data Wisata ',
      url:
          logo,
      desc: 'ini pantai slopeng'),
  Dummy(
      title: 'Data Wisata ',
      url:
          logo,
      desc: 'ini pantai slopeng'),
  Dummy(
      title: 'Data Wisata ',
      url:
          logo,
      desc: 'ini pantai slopeng'),
  Dummy(
      title: 'Data Wisata ',
      url:
          logo,
      desc: 'ini pantai slopeng'),
];

class PanelWidget extends StatelessWidget {
  ScrollController controller;

  PanelWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          buildDragHandle(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: x16),
            child:  Center(
              child: Text(
                '${dataDummmy.length} $panelSlideHint',
                style: const TextStyle(fontSize: x16),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: x16),
                controller: controller,
                itemCount: dataDummmy.length,
                itemBuilder: (context, int index) => Column(
                      children: [
                        Image(image: AssetImage(dataDummmy[index].url)),
                        Text(
                          '${dataDummmy[index].title} $index',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: x16),
                        )
                      ],
                    )),
          )
        ],
      );

  Widget buildDragHandle() => Center(
        child: Container(
          margin: const EdgeInsets.only(top: x8),
          width: 30,
          height: 5,
          decoration: BoxDecoration(color: Colors.grey[400]),
        ),
      );
}
