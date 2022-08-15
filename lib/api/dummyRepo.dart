import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hi_sumenep_app/constant/constant.dart';
import 'package:hi_sumenep_app/icon/icon_fasilitas_icons.dart';

List<String> category = [
  'Semua',
  'Rekomendasi',
  'Alam',
  'Religi',
  'Kuliner',
  'Budaya',
];

class Wisata {
  int id;
  String title;
  String url;
  String desc;
  double lat;
  double lon;
  int category;

  Wisata(
      {required this.id,
      required this.title,
      required this.url,
      required this.desc,
      required this.lat,
      required this.lon,
      required this.category});
}

List<Wisata> dataDummmy = [];
List<Wisata> dataFav = [];

void addData() {
  var random = Random();
  for (int i = 0; i < random.nextInt(100); i++) {
    var random = Random();
    double lat = -6.673645 - random.nextDouble();
    double lon = 113.25364 + random.nextDouble();
    dataDummmy.add(Wisata(
        id: i,
        title: 'Data Wisata $i',
        url: url,
        desc:
            '$i Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nulla posuere sollicitudin aliquam ultrices sagittis orci a. Ipsum faucibus vitae aliquet nec ullamcorper sit amet risus nullam. Enim nulla aliquet porttitor lacus luctus accumsan tortor posuere. Et ultrices neque ornare aenean euismod. Congue mauris rhoncus aenean vel elit scelerisque mauris. Hac habitasse platea dictumst quisque sagittis purus sit. Aliquet eget sit amet tellus cras adipiscing enim eu turpis. Vitae auctor eu augue ut lectus arcu bibendum at. Elit sed vulputate mi sit. Quis hendrerit dolor magna eget. Erat imperdiet sed euismod nisi porta lorem mollis aliquam ut. Sed euismod nisi porta lorem mollis. Vel turpis nunc eget lorem dolor sed. Nam at lectus urna duis convallis convallis tellus id. Adipiscing elit duis tristique sollicitudin nibh sit amet commodo. Quis hendrerit dolor magna eget est lorem ipsum. Ac tortor dignissim convallis aenean et. Non sodales neque sodales ut etiam sit amet nisl. Quis varius quam quisque id.',
        lat: lat,
        lon: lon,
        category: random.nextInt(category.length)));
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

class Fasilitas {
  String name;
  IconData icon;

  Fasilitas({required this.name, required this.icon});
}

List<Fasilitas> fasilitas = [
  Fasilitas(name: 'Musholla', icon: IconFasilitas.masjid),
  Fasilitas(name: 'Penginapan', icon: IconFasilitas.penginapan),
  Fasilitas(name: 'Area Parkir', icon: IconFasilitas.parking),
  Fasilitas(name: 'Kamar mandi', icon: IconFasilitas.toilet),
  Fasilitas(name: 'Rumah makan', icon: IconFasilitas.restaurant),
];

List<String> images = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
];

class Travel {
  String name;
  String link;

  Travel({required this.name, required this.link});
}

List<Travel> travel = [
  Travel(name: 'Travel', link: 'link wa'),
  Travel(name: 'Travel', link: 'link wa'),
  Travel(name: 'Travel', link: 'link wa'),
  Travel(name: 'Travel', link: 'link wa'),
  Travel(name: 'Travel', link: 'link wa'),
];
