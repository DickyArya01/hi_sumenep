import 'package:flutter/material.dart';
import 'package:hi_sumenep_app/page/Splashscreen.dart';
import 'package:hi_sumenep_app/page/home.dart';

void main() {
  runApp(const HiSumenep());
}

class HiSumenep extends StatefulWidget {
  const HiSumenep({Key? key}) : super(key: key);

  @override
  State<HiSumenep> createState() => _HiSumenepState();
}

class _HiSumenepState extends State<HiSumenep> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     debugShowCheckedModeBanner: false,
     title: 'Hi Sumenep',
    //  home: HomePage(),\
    home: Spalashscreen(),
    );
  }
}
