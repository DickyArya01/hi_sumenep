import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:hi_sumenep_app/constant/constant.dart';

List<String> category = [
  'Semua',
  'Rekomendasi',
  'Alam',
  'Religi',
  'Kuliner',
  'Budaya',
];

class Wisata {
  String title;
  String url;
  String desc;
  int category;

  Wisata(
      {required this.title,
      required this.url,
      required this.desc,
      required this.category});
}

List<Wisata> dataDummmy = [];
List<Wisata> dataFiltered = [];

void addData() {
  var random = Random();
  for (int i = 0; i < random.nextInt(100); i++) {
    var random = Random();
    dataDummmy.add(Wisata(
        title: 'Data Wisata',
        url: url,
        desc: 'Ini deskripsi wisata',
        category: random.nextInt(category.length)));
  }
}

List<Wisata> implementData(int index) {
  if (index == 0) {
    return dataDummmy;
  } else {
    return dataFiltered =
        dataDummmy.where((i) => i.category == index).toList();
  }
}
