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
  double lat;
  double lon;
  int category;

  Wisata(
      {required this.title,
      required this.url,
      required this.desc,
      required this.lat,
      required this.lon,
      required this.category});
}

List<Wisata> dataDummmy = [];
List<Wisata> dataFiltered = [];

void addData() {
  var random = Random();
  for (int i = 0; i < random.nextInt(100); i++) {
    var random = Random();
    double lat = -6.673645 - random.nextDouble();
    double lon = 113.25364 + random.nextDouble();
    dataDummmy.add(Wisata(
        title: 'Data Wisata $i',
        url: url,
        desc: 'Ini deskripsi wisata $i',
        lat: lat,
        lon: lon,
        category: random.nextInt(category.length)));
  }
}

List<Wisata> implementData(int index) {
  if (index == 0) {
    return dataDummmy;
  } else {
    return dataFiltered = dataDummmy.where((i) => i.category == index).toList();
  }
}

List<Comment> komen = [];

class Comment {
  String user;
  String comment;

  Comment({required this.user, required this.comment});
}

void addComment() {
  var random = Random();
  for (var i = 0; i < random.nextInt(200); i++) {
    komen.add(Comment(
        user: 'User $i',
        comment:
            'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...'));
  }
}
