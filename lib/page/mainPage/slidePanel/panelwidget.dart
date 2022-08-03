import 'package:flutter/cupertino.dart';
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
  Dummy
  (title: 'Pantai Slopeng', 
  url: 'https://beritalima.com/wp-content/uploads/2020/03/@andrewardara-630x380-1.jpg', 
  desc: 'ini pantai slopeng'),
  Dummy
  (title: 'Pantai Slopeng', 
  url: 'https://beritalima.com/wp-content/uploads/2020/03/@andrewardara-630x380-1.jpg', 
  desc: 'ini pantai slopeng'),
  Dummy
  (title: 'Pantai Slopeng', 
  url: 'https://beritalima.com/wp-content/uploads/2020/03/@andrewardara-630x380-1.jpg', 
  desc: 'ini pantai slopeng'),
  Dummy
  (title: 'Pantai Slopeng', 
  url: 'https://beritalima.com/wp-content/uploads/2020/03/@andrewardara-630x380-1.jpg', 
  desc: 'ini pantai slopeng'),
];

class PanelWidget extends StatelessWidget {
  ScrollController controller;
  
  PanelWidget({Key? key, required this.controller}) : super(key: key);


  @override
  Widget build(BuildContext context) => ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: x16),
      controller: controller,
      itemCount: dataDummmy.length,
      itemBuilder: (context, int index)=> Column(
        children: [
          Image(image: NetworkImage(dataDummmy[index].url)),
          Text(dataDummmy[index].title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: x16
          ),)
        ],
      )
      );
}



