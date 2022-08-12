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
        desc: '$i Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nulla posuere sollicitudin aliquam ultrices sagittis orci a. Ipsum faucibus vitae aliquet nec ullamcorper sit amet risus nullam. Enim nulla aliquet porttitor lacus luctus accumsan tortor posuere. Et ultrices neque ornare aenean euismod. Congue mauris rhoncus aenean vel elit scelerisque mauris. Hac habitasse platea dictumst quisque sagittis purus sit. Aliquet eget sit amet tellus cras adipiscing enim eu turpis. Vitae auctor eu augue ut lectus arcu bibendum at. Elit sed vulputate mi sit. Quis hendrerit dolor magna eget. Erat imperdiet sed euismod nisi porta lorem mollis aliquam ut. Sed euismod nisi porta lorem mollis. Vel turpis nunc eget lorem dolor sed. Nam at lectus urna duis convallis convallis tellus id. Adipiscing elit duis tristique sollicitudin nibh sit amet commodo. Quis hendrerit dolor magna eget est lorem ipsum. Ac tortor dignissim convallis aenean et. Non sodales neque sodales ut etiam sit amet nisl. Quis varius quam quisque id.',
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
